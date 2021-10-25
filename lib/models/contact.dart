import 'dart:convert';

class Contact {
  Contact({
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  String name;
  String phoneNumber;
  String email;

  factory Contact.fromJson(String str) => Contact.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}
