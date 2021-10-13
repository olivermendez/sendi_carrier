import 'dart:convert';

CommoditiesPost commoditiesPostFromJson(String str) =>
    CommoditiesPost.fromJson(json.decode(str));

String commoditiesPostToJson(CommoditiesPost data) =>
    json.encode(data.toJson());

class CommoditiesPost {
  CommoditiesPost({
    required this.location,
    required this.id,
    required this.name,
    required this.description,
    required this.website,
    required this.phone,
    required this.email,
    required this.address,
    required this.careers,
    required this.photo,
    required this.housing,
    required this.jobAssistance,
    required this.jobGuarantee,
    required this.acceptGi,
    required this.createdAt,
    required this.slug,
    required this.v,
    required this.commoditiesPostId,
  });

  Location location;
  String id;
  String name;
  String description;
  String website;
  String phone;
  String email;
  String address;
  List<String> careers;
  String photo;
  bool housing;
  bool jobAssistance;
  bool jobGuarantee;
  bool acceptGi;
  DateTime createdAt;
  String slug;
  int v;
  String commoditiesPostId;

  factory CommoditiesPost.fromJson(Map<String, dynamic> json) =>
      CommoditiesPost(
        location: Location.fromJson(json["location"]),
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        website: json["website"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        careers: List<String>.from(json["careers"].map((x) => x)),
        photo: json["photo"],
        housing: json["housing"],
        jobAssistance: json["jobAssistance"],
        jobGuarantee: json["jobGuarantee"],
        acceptGi: json["acceptGi"],
        createdAt: DateTime.parse(json["createdAt"]),
        slug: json["slug"],
        v: json["__v"],
        commoditiesPostId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "name": name,
        "description": description,
        "website": website,
        "phone": phone,
        "email": email,
        "address": address,
        "careers": List<dynamic>.from(careers.map((x) => x)),
        "photo": photo,
        "housing": housing,
        "jobAssistance": jobAssistance,
        "jobGuarantee": jobGuarantee,
        "acceptGi": acceptGi,
        "createdAt": createdAt.toIso8601String(),
        "slug": slug,
        "__v": v,
        "id": commoditiesPostId,
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
