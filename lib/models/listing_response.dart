import 'dart:convert';

import 'listing.dart';

class ListingResponse {
  ListingResponse({
    required this.qty,
    required this.listing,
  });

  int qty;
  List<Listing> listing;

  factory ListingResponse.fromRawJson(String str) =>
      ListingResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListingResponse.fromJson(Map<String, dynamic> json) =>
      ListingResponse(
        qty: json["qty"],
        listing:
            List<Listing>.from(json["listing"].map((x) => Listing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "qty": qty,
        "listing": List<dynamic>.from(listing.map((x) => x.toJson())),
      };
}
