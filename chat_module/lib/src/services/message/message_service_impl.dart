// ignore_for_file: close_sinks

// ignore: import_of_legacy_library_into_null_safe
import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import '../../models/message.dart';
import '../../models/user.dart';
import '../encryption/encryption_service_contract.dart';
import 'message_service_contract.dart';

class MessageService implements IMessageService {
  final Connection _connection;
  final Rethinkdb r;
  final IEncryption _encryption;

  final StreamController<Message>? _controller =
      StreamController<Message>.broadcast();

  // ignore: cancel_subscriptions
  StreamSubscription? _changeFeed;

  // ignore: sort_constructors_first
  MessageService(this.r, this._connection, this._encryption);

  @override
  dispose() {
    _controller?.close();
    _changeFeed?.cancel();
  }

  @override
  Stream<Message> messages({User? activeUser}) {
    _startReceivingMessages(activeUser!);
    return _controller!.stream;
  }

  @override
  Future<bool> send(Message message) async {
    final data = message.toJson();
    data['content'] = _encryption.encrypt(message.contents);

    final record = await r.table('messages').insert(data).run(_connection);
    return record['inserted'] == 1;
  }

  StreamSubscription<Feed> _startReceivingMessages(User user) => _changeFeed = r
      .table('messages')
      .filter({'to': user.id})
      .changes({'include_initial': true})
      .run(_connection)
      .asStream()
      .cast<Feed>()
      .listen((event) {
        event
            .forEach((feedData) {
              // ignore: always_put_control_body_on_new_line
              if (feedData['new_val'] == null) return;
              final message = _messageFromFeed(feedData);
              _controller?.sink.add(message);
              _removeDeliverredMessage(message);
            })
            // ignore: avoid_print
            .catchError(print)
            // ignore: avoid_print
            .onError((err, stackTrace) => print(err));
      });

  Message _messageFromFeed(feedData) {
    final data = feedData['new_val'];
    data['content'] = _encryption.decrypt(data['content']);
    return Message.fromJson(data);
  }

  Future _removeDeliverredMessage(Message message) => r
      .table('messages')
      .get(message.id)
      .delete({'return_changes': false}).run(_connection);
}
