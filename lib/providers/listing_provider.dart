import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/constant.dart';
import 'package:sendi_carriers/models/listing.dart';

import 'package:http/http.dart' as http;
import 'package:sendi_carriers/models/listing_response.dart';
import 'package:sendi_carriers/models/token.dart';

class ListingProvider extends ChangeNotifier {
  var url = Uri.parse('${Constants.apiUrl}listings/');

  List<Listing> onDisplayListing = [];

  ListingProvider() {
    print("Listing Provider inicializado");
    //this.onDisplayListing();
  }

  getListing(Token token) async {
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': "Bearer ${token.token}"
      },
    );

    final nowListingResponse = ListingResponse.fromJson(response.body);

    print(nowListingResponse.results[0].title);

    notifyListeners();
  }
}
