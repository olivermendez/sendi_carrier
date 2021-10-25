class Contact {
  Contact({
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  String name;
  String phoneNumber;
  String email;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}
