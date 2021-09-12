class Message {
  final String from;
  final String to;
  final DateTime timestamp;
  final String contents;
  String? id;

  // ignore: sort_constructors_first
  Message({
    required this.from,
    required this.to,
    required this.timestamp,
    required this.contents,
  });

  Map<String, dynamic> toJson() =>
      {'from': from, 'to': to, 'timestamp': timestamp, 'contents': contents};

  // ignore: sort_constructors_first
  factory Message.fromJson(Map<String, dynamic> json) {
    // ignore: prefer_final_locals
    var message = Message(
        from: json['from'],
        to: json['to'],
        timestamp: json['timestamp'],
        contents: json['contents']);
    // ignore: cascade_invocations
    message.id = json['id'];
    return message;
  }
}
