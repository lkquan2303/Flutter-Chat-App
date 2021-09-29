import 'package:chat_app/data/datasource/sqflite_datasource_impl.dart';
import 'package:chat_app/pages/messages/models/chat.dart';
import 'package:chat_app/pages/messages/models/local_message.dart';
import 'package:chat_module/chat_module.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqlite_api.dart';

class MockSqfliteDatabase extends Mock implements Database {}

class MockBatch extends Mock implements Batch {}

void main() {
  SqfliteDatasource? sut;
  MockSqfliteDatabase? database;
  MockBatch batch;

  setUp(() {
    database = MockSqfliteDatabase();
    batch = MockBatch();
    sut = SqfliteDatasource(database!);
  });

  final message = Message.fromJson({
    'from': '111',
    'to': '222',
    'content': 'hey',
    'timestamp': DateTime.parse("2021-04-01"),
    'id': '4444',
  });

  test('should perform insert of chat to the database', () async {
    final chat = Chat('1234');
    when(database!.insert('chats', chat.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace))
        .thenAnswer((_) => 1);

    await sut!.addChat(chat);

    verify(database!.insert('chats', chat.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace))
        .called(1);
  });

  test('should perform insert of message to the database', () async {
    final localMessage = LocalMessage(
        chatId: '1234', message: message, receipt: ReceiptStatus.sent);

    when(database!.insert('messages', localMessage.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace))
        .thenAnswer((_) async => 1);

    await sut!.addMessage(localMessage);

    verify(database!.insert('messages', localMessage.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace))
        .called(1);
  });

  test('should perform a database query and return message', () async {
    final messageMap = [
      {
        'chat_id': '111',
        'id': '4444',
        'from': '111',
        'to': '222',
        'contents': 'hyy',
        'receipt': 'sent',
        'timestamp': DateTime.parse('2021-04-01')
      }
    ];
  });
}
