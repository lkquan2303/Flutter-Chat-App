// ignore: import_of_legacy_library_into_null_safe
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import '../../models/user.dart';
import 'user_service_contract.dart';

class UserService implements IUserService {
  final Connection _connection;
  final Rethinkdb r;

  // ignore: sort_constructors_first
  UserService(this._connection, this.r);

  // ignore: empty_constructor_bodies
  @override
  Future<User> connect(User user) async {
    final data = user.toJson();
    // ignore: unnecessary_null_comparison
    if (user.id != null) {
      data['id'] = user.id;
    }

    final result = await r.table('users').insert(
        data, {'conflict': 'update', 'return_changes': true}).run(_connection);

    return User.fromJson(result['changes'].first['new_val']);
  }

  @override
  Future<void> disconnect(User user) async {
    await r.table('users').update({
      'id': user.id,
      'active': 'false',
      'last_seen': DateTime.now()
    }).run(_connection);
    _connection.close();
  }

  @override
  Future<List<User>> online() async {
    final Cursor users =
        await r.table('users').filter({'active': true}).run(_connection);
    final userList = await users.toList();
    return userList.map((item) => User.fromJson(item)).toList();
  }
}
