import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sendi_carriers/models/commodities_model.dart';

List<CommoditiesPost> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<CommoditiesPost>((json) => CommoditiesPost.fromJson(json))
      .toList();
}

Future<List<CommoditiesPost>> fetchPhotos(http.Client client) async {
  final response =
      await client.get(Uri.parse('http://localhost:5000/api/v1/listings/'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return parsePhotos(response.body);
}
