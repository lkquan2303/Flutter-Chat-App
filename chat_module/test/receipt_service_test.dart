import 'package:chat_module/src/models/receipt.dart';
import 'package:chat_module/src/models/user.dart';
import 'package:chat_module/src/services/receipt/receipt_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rethinkdb_dart/rethinkdb_dart.dart';

import 'helpers.dart';

void main() {
  final r = Rethinkdb();
  Connection? connection;
  ReceipService? sut;

  setUp(() async {
    connection = await r.connect();
    await createDb(r, connection!);
    sut = ReceipService(r, connection!);
  });

  tearDown(() async {
    sut!.dispose();
    await cleanDb(r, connection!);
  });

  final user = User.fromJson({
    'id': '1234',
    'active': true,
    'lastSeen': DateTime.now(),
  });

  test('sent receipt successfully', () async {
    final receipt = Receipt(
      recipient: '1234',
      messageId: '12345',
      status: ReceiptStatus.deliverred,
      timeStamp: DateTime.now(),
    );

    final res = await sut!.send(receipt);
    expect(res, true);
  });

  test('successfully subcribe and receive receipts', () async {
    sut!.receipts(user).listen(expectAsync1((receipt) {
          expect(receipt.recipient, user.id);
        }, count: 2));

    final receipt = Receipt(
      recipient: user.id!,
      messageId: '1234',
      status: ReceiptStatus.deliverred,
      timeStamp: DateTime.now(),
    );

    final anotherReceipt = Receipt(
      recipient: user.id!,
      messageId: '3214',
      status: ReceiptStatus.read,
      timeStamp: DateTime.now(),
    );

    await sut!.send(receipt);
    await sut!.send(anotherReceipt);
  });
}
