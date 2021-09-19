import 'dart:async';

// ignore: import_of_legacy_library_into_null_safe
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import '../../models/typing_event.dart';
import '../../models/user.dart';
import 'typing_notification_service_contract.dart';

class TypingNotification implements ITypingNotification {
  final Connection _connection;
  final Rethinkdb r;
  final _controller = StreamController<TypingEvent>.broadcast();

  // ignore: sort_constructors_first
  TypingNotification(this._connection, this.r);

  StreamSubscription? _changeFeed;
  @override
  Future<bool> send({required TypingEvent event, required User to}) async {
    // ignore: always_put_control_body_on_new_line
    if (!to.isActive) return true;
    final Map record = await r
        .table('receipts')
        .insert(event.toJson(), {'conflict': 'update'}).run(_connection);

    return record['inserted'] == 1;
  }

  @override
  Stream<TypingEvent> subscribe(User user, List<String> userIds) {
    _startReceivingTypingEvent(user, userIds);
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    _changeFeed!.cancel();
  }

  // ignore: always_declare_return_types
  _startReceivingTypingEvent(User user, List<String> userIds) {
    _changeFeed = r
        .table('typing_events')
        .filter((event) {
          return event('to')
              .eq(user.id)
              .and(r.expr(userIds).contains(event('from')));
        })
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                // ignore: always_put_control_body_on_new_line
                if (feedData['new_val'] == null) return;
                final typing = _eventFromFeed(feedData);
                _controller.sink.add(typing);
                _removeEvent(typing);
              })
              // ignore: avoid_print
              .catchError(print)
              // ignore: avoid_print
              .onError((err, stackTrace) => print(err));
        });
  }

  TypingEvent _eventFromFeed(feedData) {
    return TypingEvent.fromJson(feedData['new_val']);
  }

  void _removeEvent(TypingEvent event) {
    r
        .table('typing_events')
        .get(event.id)
        .delete({'return_change': false}).run(_connection);
  }
}
