// To parse this JSON data, do
//
//     final locationResponse = locationResponseFromJson(jsonString);

import 'dart:convert';

class LocationResponse {
  LocationResponse({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory LocationResponse.fromRawJson(String str) =>
      LocationResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      LocationResponse(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.locationFrom,
    required this.locationTo,
    required this.id,
    required this.price,
    required this.category,
    required this.addressFrom,
    required this.addressTo,
    required this.listing,
    required this.v,
    required this.datumId,
  });

  Location locationFrom;
  Location locationTo;
  String id;
  int price;
  String category;
  String addressFrom;
  String addressTo;
  String listing;
  int v;
  String datumId;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        locationFrom: Location.fromJson(json["locationFrom"]),
        locationTo: Location.fromJson(json["locationTo"]),
        id: json["_id"],
        price: json["price"],
        category: json["category"],
        addressFrom: json["addressFrom"],
        addressTo: json["addressTo"],
        listing: json["listing"],
        v: json["__v"],
        datumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "locationFrom": locationFrom.toJson(),
        "locationTo": locationTo.toJson(),
        "_id": id,
        "price": price,
        "category": category,
        "addressFrom": addressFrom,
        "addressTo": addressTo,
        "listing": listing,
        "__v": v,
        "id": datumId,
      };
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
    required this.formattedAddress,
    required this.street,
    required this.city,
    required this.state,
    required this.zipcode,
    required this.country,
  });

  String type;
  List<double> coordinates;
  String formattedAddress;
  String street;
  String city;
  String state;
  String zipcode;
  String country;

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        formattedAddress: json["formattedAddress"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "formattedAddress": formattedAddress,
        "street": street,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
      };
}
