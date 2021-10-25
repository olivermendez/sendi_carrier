import 'dart:convert';

import 'package:sendi_carriers/models/listing.dart';

class ListingResponse {
  ListingResponse({
    required this.totalListing,
    required this.results,
  });

  int totalListing;
  List<Listing> results;

  factory ListingResponse.fromJson(String str) =>
      ListingResponse.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory ListingResponse.fromMap(Map<String, dynamic> json) => ListingResponse(
        totalListing: json["totalListing"],
        results:
            List<Listing>.from(json["results"].map((x) => Listing.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "totalListing": totalListing,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
      };
}

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

  String toJson() => json.encode(toMap());

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
