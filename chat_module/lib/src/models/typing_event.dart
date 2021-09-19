enum Typing { start, stop }

extension TypingParse on Typing {
  String value() {
    return toString().split('.').last;
  }

  static Typing fromString(String event) {
    return Typing.values.firstWhere((element) => element.value() == event);
  }
}

class TypingEvent {
  final String from;
  final String to;
  final Typing event;
  String get id => _id!;
  String? _id;

  // ignore: sort_constructors_first
  TypingEvent({required this.from, required this.to, required this.event});

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'event': event.value(),
      };

  // ignore: sort_constructors_first
  factory TypingEvent.fromJson(Map<String, dynamic> json) {
    final event = TypingEvent(
      from: json['from'],
      to: json['to'],
      event: TypingParse.fromString(json['event']),
    );
    // ignore: cascade_invocations
    event._id = json['id'];
    return event;
  }
}
