import 'dart:convert';

import 'package:sendi_carriers/models/listing_response.dart';

import 'location.dart';

class Listing {
  Listing({
    this.contact,
    required this.locationFrom,
    required this.locationTo,
    required this.comodity,
    required this.id,
    required this.title,
    required this.description,
    required this.phone,
    required this.addressFrom,
    required this.addressTo,
    required this.photo,
    required this.price,
    required this.widthInMeters,
    required this.lengthInMeters,
    required this.heightInMeters,
    required this.weightInGrams,
    required this.unitCount,
    required this.user,
    required this.createdAt,
    required this.v,
    required this.resultId,
  });

  Contact? contact;
  Location locationFrom;
  Location locationTo;
  String comodity;
  String id;
  String title;
  String description;
  String phone;
  String addressFrom;
  String addressTo;
  String photo;
  int price;
  double widthInMeters;
  double lengthInMeters;
  double heightInMeters;
  int weightInGrams;
  int unitCount;
  String user;
  DateTime createdAt;
  int v;
  String resultId;

  factory Listing.fromJson(String str) => Listing.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Listing.fromMap(Map<String, dynamic> json) => Listing(
        contact: Contact.fromMap(json["contact"]),
        locationFrom: Location.fromMap(json["locationFrom"]),
        locationTo: Location.fromMap(json["locationTo"]),
        comodity: json["comodity"],
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        phone: json["phone"],
        addressFrom: json["addressFrom"],
        addressTo: json["addressTo"],
        photo: json["photo"],
        price: json["price"],
        widthInMeters: json["widthInMeters"].toDouble(),
        lengthInMeters: json["lengthInMeters"].toDouble(),
        heightInMeters: json["heightInMeters"].toDouble(),
        weightInGrams: json["weightInGrams"],
        unitCount: json["unitCount"],
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        resultId: json["id"],
      );
}
