import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sendi_carriers/models/listing/listing.dart';
import 'package:sendi_carriers/models/locations/location_response.dart';
import 'package:sendi_carriers/pages/map_screen/map_screen.dart';

import 'package:http/http.dart' as http;
import '../../config/constant.dart';
import '../../models/listing/listing_response.dart';
import '../../models/user/token.dart';
import '../../providers/data_services.dart';
import '../../widgets/app_bar/product_pages.dart';
import '../home/home_page.dart';

class DetailPageListing extends StatefulWidget {
  final Listing listing;
  final Token token;
  const DetailPageListing(
      {Key? key, required this.listing, required this.token})
      : super(key: key);

  static const String routenName = 'detail';

  @override
  _DetailPageListingState createState() => _DetailPageListingState();
}

class _DetailPageListingState extends State<DetailPageListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarProductPage(widget.listing),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                getListingDetails(),
                ButtonActionOnListing(
                  listing: widget.listing,
                  id: widget.listing.id,
                  token: widget.token,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getListingDetails() {
    const status = 'Location';
    return FutureBuilder(
      future: DataServices.getLocationFromSingleListing(
          widget.token, widget.listing),
      builder: (context, AsyncSnapshot<LocationResponse?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data!.data.isEmpty) {
          return noListingFound(status);
        } else {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: DisplayLocationInfo(
              locationF: snapshot.data!.data[0].locationFrom,
              locationT: snapshot.data!.data[0].locationTo,
              startDestination: snapshot.data!.data[0].addressFrom,
              endDestination: snapshot.data!.data[0].addressTo,
              price: snapshot.data!.data[0].price,
              category: snapshot.data!.data[0].category,
              listing: widget.listing,
              token: widget.token,
            ),
          );
        }
      },
    );
  }

  Widget noListingFound(String status) {
    return Center(
        child: Text(
      "No $status listing",
    ));
  }
}

class DisplayLocationInfo extends StatefulWidget {
  Location locationF;
  Location locationT;
  String startDestination;
  String endDestination;
  int price;
  String category;
  Listing listing;
  final Token token;

  DisplayLocationInfo({
    Key? key,
    required this.locationF,
    required this.locationT,
    required this.startDestination,
    required this.endDestination,
    required this.price,
    required this.category,
    required this.listing,
    required this.token,
  }) : super(key: key);

  @override
  State<DisplayLocationInfo> createState() => _DisplayLocationInfoState();
}

class _DisplayLocationInfoState extends State<DisplayLocationInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.listing.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          "Total Amount: DOP ${widget.price}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
          child: Stack(
            children: const [
              Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                  "Pickup information",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              widget.locationF.city,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              widget.startDestination,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
                fontFamily: 'medium',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              widget.locationF.state,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
                fontFamily: 'medium',
              ),
            ),
          ],
        ),
        const Divider(),
        SizedBox(
          height: 30,
          child: Stack(
            children: const [
              Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                  "Destination information",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              widget.locationT.city,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              widget.endDestination,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
                fontFamily: 'medium',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              widget.locationT.state,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
                fontFamily: 'medium',
              ),
            ),
          ],
        ),
        const Divider(),
        SizedBox(
          height: 30,
          child: Stack(
            children: const [
              Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                  "Item Description",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              widget.listing.title,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
                fontFamily: 'medium',
              ),
            ),
          ],
        ),
        const Divider(),
        SizedBox(
          height: 30,
          child: Stack(
            children: const [
              Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                  "Item Description",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              widget.listing.description,
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
                fontFamily: 'medium',
              ),
            ),
          ],
        ),
        const Divider(),
        SizedBox(
          height: 30,
          child: Stack(
            children: const [
              Positioned(
                left: 0,
                bottom: 0,
                child: Text(
                  "Total Amount",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              widget.price.toString(),
              style: const TextStyle(
                color: Color(0xFF787878),
                fontSize: 12,
                fontFamily: 'medium',
              ),
            ),
          ],
        ),
        const Divider(),
        ElevatedButton(
            onPressed: () {
              //print(widget.locationF.coordinates[]);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapSample(
                            startPositionLong: widget.locationF.coordinates[0],
                            startPositionLat: widget.locationF.coordinates[1],
                            endPositionLong: widget.locationT.coordinates[0],
                            endPositionLat: widget.locationT.coordinates[1],
                          )));
            },
            child: const Text("View Destination on Google Maps")),
      ],
    );
  }
}

class ButtonActionOnListing extends StatefulWidget {
  final Token token;
  final Listing listing;
  final String id;
  const ButtonActionOnListing(
      {required this.listing, required this.token, Key? key, required this.id})
      : super(key: key);

  @override
  State<ButtonActionOnListing> createState() => _ButtonActionOnListingState();
}

class _ButtonActionOnListingState extends State<ButtonActionOnListing> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: MaterialButton(
          color: Colors.blue[900],
          onPressed: () {
            bookListing('booked', widget.token.user.id);
          },
          child: const Text(
            'Accept Listing',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> bookListing(
    final String _status,
    final String _driverId,
  ) async {
    Map<String, dynamic> request = {
      "status": _status,
      "driverId": _driverId,
    };
    print("AQUIIII: " + widget.id);

    //var url = Uri.parse('${Constants.apiUrl}listings/${token.user.id}/vehicle');
    var url = Uri.parse('${Constants.apiUrl}listings/${widget.id}');

    var response = await http.put(
      url,
      body: jsonEncode(request),
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer ${widget.token.token}'
      },
    );
    //var body = response.body;
    //var decodedJson = jsonDecode(body);
    //var listing = ListingResponse.fromJson(decodedJson);
    //print(listing.listing);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  token: widget.token,
                )));
  }
}
