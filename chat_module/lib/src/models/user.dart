class User {
  String? id;
  String userName;
  String photoUrl;
  bool isActive;
  DateTime lastSeen;

  // ignore: sort_constructors_first
  User({
    // ignore: always_put_required_named_parameters_first
    required this.userName,
    // ignore: always_put_required_named_parameters_first
    required this.photoUrl,
    // ignore: always_put_required_named_parameters_first
    required this.isActive,
    // ignore: always_put_required_named_parameters_first
    required this.lastSeen,
  });

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'photoUrl': photoUrl,
        'isActive': isActive,
        'lastSeen': lastSeen
      };

  // ignore: sort_constructors_first
  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
      userName: json['userName'],
      photoUrl: json['photoUrl'],
      isActive: json['isActive'],
      lastSeen: json['lastSeen'],
    );
    // ignore: cascade_invocations
    user.id = json['id'];
    return user;
  }
}
