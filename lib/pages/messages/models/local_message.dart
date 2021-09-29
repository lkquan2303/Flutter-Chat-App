import 'package:chat_module/chat_module.dart';

class LocalMessage {
  String chatId;
  String get id => _id!;
  String? _id;
  Message message;
  ReceiptStatus receipt;

  // ignore: sort_constructors_first
  LocalMessage(
      {required this.chatId, required this.message, required this.receipt});

  Map<String, dynamic> toMap() => {
        'chat_id': chatId,
        'id': message.id,
        ...message.toJson(),
        'receipt': receipt.value(),
      };

  // ignore: sort_constructors_first
  factory LocalMessage.fromJson(Map<String, dynamic> json) {
    final message = Message(
      from: json['from'],
      to: json['to'],
      timestamp: json['timestamp'],
      contents: json['content'],
    );

    final localMessage = LocalMessage(
        chatId: json['chat_id'],
        message: message,
        receipt: EnumParsing.fromString(json['receipt']));
    // ignore: cascade_invocations
    localMessage._id = json['id'];

    return localMessage;
  }
}
