import 'package:chat_module/src/models/user.dart';
import 'package:chat_module/src/services/user/user_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import 'helpers.dart';

void main() {
  final r = Rethinkdb();
  Connection? connection;
  UserService? sut;

  setUp(() async {
    connection = await r.connect(host: "127.0.0.1", port: 28015);
    await createDb(r, connection!);
    sut = UserService(connection!, r);
  });

  tearDown(() async {
    //  await cleanDb(r, connection!);
  });
  test('create a new user document in database', () async {
    final user = User(
      userName: 'Test',
      photoUrl: 'URL',
      isActive: true,
      lastSeen: DateTime.now(),
    );

    final userWithId = await sut!.connect(user);
    expect(userWithId.id, isNotEmpty);
  });
}
