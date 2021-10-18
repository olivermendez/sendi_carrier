import 'package:sendi_carriers/models/user_model.dart';

class Token {
  Token({
    required this.token,
    required this.user,
  });

  String token = '';
  User user = User(
      id: '',
      name: '',
      username: '',
      email: '',
      role: '',
      password: '',
      createdAt: DateTime.now(),
      v: 0);

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}
