import 'dart:async';

import 'package:chat_module/src/models/receipt.dart';
import 'package:chat_module/src/models/user.dart';
import 'package:chat_module/src/services/receipt/receipt_service_contract.dart';
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

class ReceipService implements IReceiptService {
  final Connection _connection;
  final Rethinkdb r;

  final StreamController<Receipt>? _controller =
      StreamController<Receipt>.broadcast();

  // ignore: cancel_subscriptions
  StreamSubscription? _changeFeed;

  // ignore: sort_constructors_first
  ReceipService(this.r, this._connection);

  @override
  void dispose() {
    _controller?.close();
    _changeFeed?.cancel();
  }

  @override
  Stream<Receipt> receipts(User? user) {
    _startReceivingReceipt(user!);
    return _controller!.stream;
  }

  @override
  Future<bool> send(Receipt receipt) async {
    final data = receipt.toJson();

    final record = await r.table('receipts').insert(data).run(_connection);
    return record['inserted'] == 1;
  }

  StreamSubscription<Feed> _startReceivingReceipt(User user) => _changeFeed = r
      .table('receipts')
      .filter({'recipient': user.id})
      .changes({'include_initial': true})
      .run(_connection)
      .asStream()
      .cast<Feed>()
      .listen((event) {
        event
            .forEach((feedData) {
              // ignore: always_put_control_body_on_new_line
              if (feedData['new_val'] == null) return;
              final message = _receiptFromFeed(feedData);
              _controller?.sink.add(message);
              // ignore: avoid_print
            })
            .catchError(print)
            .onError((err, stackTrace) => print(err));
      });

  Receipt _receiptFromFeed(feedData) {
    final data = feedData['new_val'];
    return Receipt.fromJson(data);
  }
}
