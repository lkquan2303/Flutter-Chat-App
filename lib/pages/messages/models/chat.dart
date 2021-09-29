import 'local_message.dart';

class Chat {
  String id;
  int unread = 0;
  List<LocalMessage> messages = [];
  LocalMessage? mostRecent;

  // ignore: sort_constructors_first
  Chat(this.id, {this.mostRecent, messages});

  Map<String, dynamic> toMap() => {'id': id};

  // ignore: sort_constructors_first
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(json['id']);
}
