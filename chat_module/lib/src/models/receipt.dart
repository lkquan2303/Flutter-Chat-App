enum ReceiptStatus { sent, deliverred, read }

extension EnumParsing on ReceiptStatus {
  String value() {
    return toString().split('.').last;
  }

  static ReceiptStatus fromString(String status) {
    return ReceiptStatus.values
        .firstWhere((element) => element.value() == status);
  }
}

class Receipt {
  final String recipient;
  final String messageId;
  final ReceiptStatus status;
  final DateTime timestamp;
  String? _id;
  String get id => _id!;

  // ignore: sort_constructors_first
  Receipt({
    required this.recipient,
    required this.messageId,
    required this.status,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'recipient': recipient,
        'messageId': messageId,
        'stataus': status.value(),
        'timestamp': timestamp,
      };

  // ignore: sort_constructors_first
  factory Receipt.fromJson(Map<String, dynamic> json) {
    final receipt = Receipt(
      recipient: json['recipient'],
      messageId: json['messageId'],
      status: EnumParsing.fromString(json['status']),
      timestamp: json['timestamp'],
    );
    // ignore: cascade_invocations
    receipt._id = json['id'];
    return receipt;
  }
}
