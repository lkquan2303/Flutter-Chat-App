// ignore: import_of_legacy_library_into_null_safe
import 'package:chat_module/src/models/message.dart';
import 'package:chat_module/src/models/user.dart';
import 'package:chat_module/src/services/encryption/encryption_service_impl.dart';
import 'package:chat_module/src/services/message/message_service_impl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import 'helpers.dart';

void main() {
  final r = Rethinkdb();
  Connection? connection;
  MessageService? sut;

  setUp(() async {
    connection = await r.connect(host: '127.0.0.1', port: 28015);
    final encryption = EncryptionService(Encrypter(AES(Key.fromLength(32))));
    await createDb(r, connection!);
    sut = MessageService(r, connection!, encryption);
  });

  tearDown(() async {
    sut?.dispose();
    // await cleanDb(r, connection!);
  });

  final user = User.fromJson({
    'id': '1234',
    'active': true,
    'lastSeen': DateTime.now(),
  });

  final user2 = User.fromJson({
    'id': '1111',
    'active': true,
    'lastSeen': DateTime.now(),
  });
  test('send message successfully', () async {
    final messageSent = Message(
        from: user.id!,
        to: '3456',
        timestamp: DateTime.now(),
        contents: 'Hello Test');
    final res = await sut?.send(messageSent);
    expect(res, true);
  });

  test('successfully subscribe and receive messages', () async {
    // ignore: prefer_const_declarations
    final content = 'this is message';

    sut?.messages(activeUser: user2).listen(expectAsync1((message) {
          expect(message.to, user2.id);
          expect(message.id, isNotEmpty);
          expect(message.contents, content);
        }, count: 1));

    final message = Message(
      from: user.id!,
      to: user2.id!,
      timestamp: DateTime.now(),
      contents: content,
    );

    final seconedMessage = Message(
      from: user.id!,
      to: user2.id!,
      timestamp: DateTime.now(),
      contents: content,
    );

    await sut?.send(message);
    await sut?.send(seconedMessage).whenComplete(
          () => sut?.messages(activeUser: user2).listen(
                expectAsync1(
                  (message) {
                    expect(message.to, user2.id);
                  },
                  count: 2,
                ),
              ),
        );
  });
}
