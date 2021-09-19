import '../../models/receipt.dart';
import '../../models/user.dart';

abstract class IReceiptService {
  Future<bool> send(Receipt receipt);
  Stream<Receipt> receipts(User user);
  void dispose();
}
