import 'package:chat_module/src/models/typing_event.dart';
import 'package:chat_module/src/models/user.dart';
import 'package:chat_module/src/services/typing/typing_notification_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import 'helpers.dart';

void main() {
  final r = Rethinkdb();
  Connection? _connection;
  TypingNotification? sut;

  setUp(() async {
    _connection = await r.connect();
    await createDb(r, _connection!);
    sut = TypingNotification(_connection!, r);
  });

  tearDown(() async {
    sut?.dispose();
    await cleanDb(r, _connection!);
  });

  final user1 = User.fromJson({
    'id': '1234',
    'isActive': true,
    'lastSeen': DateTime.now(),
  });

  final user2 = User.fromJson({
    'id': '1111',
    'isActive': true,
    'lastSeen': DateTime.now(),
  });

  test('sent typing notification successfullt', () async {
    final typingEvent =
        TypingEvent(from: user2.id!, to: user1.id!, event: Typing.start);

    final res = await sut!.send(event: typingEvent, to: user1);
    expect(res, true);
  });

  test('successfully subcribe and receive typing events', () async {
    sut!.subscribe(user2, [user1.id!]).listen(expectAsync1((event) {
      expect(event.from, user1.id);
    }, count: 2));

    final typing = TypingEvent(
      from: user1.id!,
      to: user2.id!,
      event: Typing.start,
    );

    final stopTyping = TypingEvent(
      from: user1.id!,
      to: user2.id!,
      event: Typing.stop,
    );

    await sut!.send(event: typing, to: user2);
    await sut!.send(event: stopTyping, to: user2);
  });
}
