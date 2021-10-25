import 'listing_contact_model.dart';

class Listing {
  Listing({
    required this.title,
    required this.description,
    required this.phone,
    required this.contact,
    required this.addressFrom,
    required this.addressTo,
    required this.price,
    required this.commodity,
    required this.widthInMeters,
    required this.lengthInMeters,
    required this.heightInMeters,
    required this.weightInGrams,
    required this.unitCount,
  });

  String title;
  String description;
  String phone;
  Contact contact;
  String addressFrom;
  String addressTo;
  int price;
  String? commodity = '';
  double widthInMeters;
  double lengthInMeters;
  double heightInMeters;
  int weightInGrams;
  int unitCount;

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
        title: json["title"],
        description: json["description"],
        phone: json["phone"],
        contact: Contact.fromJson(json["contact"]),
        addressFrom: json["addressFrom"],
        addressTo: json["addressTo"],
        price: json["price"],
        // ignore: prefer_if_null_operators
        commodity: json["commodity"],
        widthInMeters: json["widthInMeters"].toDouble(),
        lengthInMeters: json["lengthInMeters"].toDouble(),
        heightInMeters: json["heightInMeters"].toDouble(),
        weightInGrams: json["weightInGrams"],
        unitCount: json["unitCount"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "phone": phone,
        "contact": contact.toJson(),
        "addressFrom": addressFrom,
        "addressTo": addressTo,
        "price": price,
        "commodity": commodity,
        "widthInMeters": widthInMeters,
        "lengthInMeters": lengthInMeters,
        "heightInMeters": heightInMeters,
        "weightInGrams": weightInGrams,
        "unitCount": unitCount,
      };
}
