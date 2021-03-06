import 'package:sqflite/sqflite.dart';

import '../../pages/messages/models/chat.dart';
import '../../pages/messages/models/local_message.dart';
import 'datasource_contract.dart';

class SqfliteDatasource implements IDatasource {
  final Database _db;

  // ignore: sort_constructors_first
  SqfliteDatasource(this._db);

  @override
  Future<void> addChat(Chat chat) async {
    await _db.insert('chats', chat.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> addMessage(LocalMessage message) async {
    await _db.insert('messages', message.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> deleteChat(String chatId) async {
    final batch = _db.batch();
    // ignore: cascade_invocations
    batch.delete('chats', where: 'id = ?', whereArgs: [chatId]);
    // ignore: cascade_invocations
    batch.delete('messages', where: 'chat_id = ?', whereArgs: [chatId]);
    await batch.commit(noResult: true);
  }

  @override
  Future<List<Chat>> findAllChat() {
    return _db.transaction((txn) async {
      final chatsWithLatestMessage = await txn.rawQuery(''' 
          SELECT messages.* FROM 
          (
            chat_id, MAX(created_at) AS created_at
            FROM messages
            GROUP BY chat_id
          ) AS latest_messages
          INNER JOIN messages
          ON messages.chat_id = latest_messages.chat_id
          AND messages.created_at = latest_messages.created_at
      ''');

      final List<Map<String, dynamic>> chatsWithUnreadMessages =
          await txn.rawQuery('''
      SELECT chat_id, count(*) as unread
      FROM messages
      WHERE receipt = ?
      GROUP BY chat_id
      ''', ['deliverred']);

      return chatsWithLatestMessage.map<Chat>((row) {
        final unread = chatsWithUnreadMessages
            .firstWhere((ele) => row['chat_id'] == ele['chat_id'])['unread'];

        final chat = Chat.fromJson(row);
        // ignore: cascade_invocations
        chat.unread = unread;
        // ignore: cascade_invocations
        chat.mostRecent = LocalMessage.fromJson(row);
        return chat;
      }).toList();
    });
  }

  @override
  Future<Chat> findChat(String chatId) async {
    return await _db.transaction((txn) async {
      final listOfChatMaps = await txn.query(
        'chats',
        where: 'id = ?',
        whereArgs: [chatId],
      );

      final unread = Sqflite.firstIntValue(
        await txn.rawQuery(
          'SELECT COUNT(*) FROM MESSAGES WHERE chat_id = ? AND receipt = ?',
          [chatId, 'deliverred'],
        ),
      );

      final mostRecentMessage = await txn.query(
        'messages',
        where: 'chat_id',
        whereArgs: [chatId],
        orderBy: 'created_at DESC',
        limit: 1,
      );

      final chat = Chat.fromJson(listOfChatMaps.first);
      // ignore: cascade_invocations
      chat.unread = unread!;
      // ignore: cascade_invocations
      chat.mostRecent = LocalMessage.fromJson(mostRecentMessage.first);
      return chat;
    });
  }

  @override
  Future<List<LocalMessage>> findMessages(String chatId) async {
    final listOfMaps = await _db.query(
      'messages',
      where: 'chat_id = ?',
      whereArgs: [chatId],
    );

    return listOfMaps
        .map<LocalMessage>((map) => LocalMessage.fromJson(map))
        .toList();
  }

  @override
  Future<void> updateMessage(LocalMessage message) async {
    await _db.update(
      'messages',
      message.toMap(),
      where: 'id = ?',
      whereArgs: [message.message.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
