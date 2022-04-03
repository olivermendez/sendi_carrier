import 'package:sendi_carriers/models/listing.dart';

import '../config/constant.dart';
import '../models/listing_response.dart';
import 'package:http/http.dart' as http;

import '../models/locations/location_response.dart';
import '../models/token.dart';

class DataServices {
  static Future<ListingResponse?> getNewListing(Token token) async {
    var url = Uri.parse('${Constants.apiUrl}listings/');

    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': "Bearer ${token.token}"
      },
    );

    final nowListingResponse = ListingResponse.fromRawJson(response.body);

    return nowListingResponse;
  }

  static Future<ListingResponse?> getBookedListing(Token token) async {
    var url =
        Uri.parse('${Constants.apiUrl}listings/driver/${token.user.id}/booked');

    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': "Bearer ${token.token}"
      },
    );

    final nowListingResponse = ListingResponse.fromRawJson(response.body);

    return nowListingResponse;
  }

  static Future<ListingResponse?> getDeliveredListing(Token token) async {
    var url = Uri.parse(
        '${Constants.apiUrl}listings/driver/${token.user.id}/delivered');

    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': "Bearer ${token.token}"
      },
    );

    final nowListingResponse = ListingResponse.fromRawJson(response.body);

    return nowListingResponse;
  }

  static Future<LocationResponse?> getLocationFromSingleListing(
      Token token, Listing listing) async {
    var url = Uri.parse('${Constants.apiUrl}listings/${listing.id}/location');

    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': "Bearer ${token.token}"
      },
    );

    final nowListingResponse = LocationResponse.fromRawJson(response.body);

    return nowListingResponse;
  }

  static Future<Datum?> getPrice(Token token, Listing listing) async {
    var url = Uri.parse('${Constants.apiUrl}listings/${listing.id}/location');

    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': "Bearer ${token.token}"
      },
    );

    final nowListingResponse = LocationResponse.fromRawJson(response.body);

    return nowListingResponse.data.first;
  }
}
