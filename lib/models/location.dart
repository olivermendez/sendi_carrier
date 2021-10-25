import 'dart:convert';

class Location {
  Location({
    this.type,
    this.coordinates,
    this.formattedAddress,
    this.street,
    this.city,
    this.state,
    this.zipcode,
    this.country,
  });

  String? type;
  List<double>? coordinates;
  String? formattedAddress;
  String? street;
  String? city;
  String? state;
  String? zipcode;
  String? country;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
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

  Map<String, dynamic> toMap() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
        "formattedAddress": formattedAddress,
        "street": street,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
      };
}
