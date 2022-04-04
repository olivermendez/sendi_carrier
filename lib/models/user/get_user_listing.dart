// To parse this JSON data, do
//
//     final GetUserResponse = GetUserResponseFromJson(jsonString);

import 'dart:convert';

class GetUserResponse {
  GetUserResponse({
    required this.success,
    required this.user,
  });

  bool success;
  UserDetails user;

  factory GetUserResponse.fromRawJson(String str) =>
      GetUserResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      GetUserResponse(
        success: json["success"],
        user: UserDetails.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
      };
}

class UserDetails {
  UserDetails({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.phone,
    required this.cedula,
    required this.createdAt,
    required this.v,
  });

  String id;
  String name;
  String username;
  String email;
  String role;
  String phone;
  String cedula;
  DateTime createdAt;
  int v;

  factory UserDetails.fromRawJson(String str) =>
      UserDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        role: json["role"],
        phone: json["phone"],
        cedula: json["cedula"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "username": username,
        "email": email,
        "role": role,
        "phone": phone,
        "cedula": cedula,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
