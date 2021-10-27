// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/constant.dart';
import 'package:sendi_carriers/models/listing.dart';
import 'package:sendi_carriers/models/listing_response.dart';
//import 'package:sendi_carriers/config/constant.dart';
//import 'package:sendi_carriers/models/listing_response.dart';
import 'package:sendi_carriers/models/token.dart';
import 'package:sendi_carriers/pages/my_account_page.dart';
import 'package:sendi_carriers/pages/payments_page.dart';
import 'package:sendi_carriers/providers/listing_provider.dart';
import 'package:sendi_carriers/widgets/drawer_header.dart';

import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final Token token;
  const HomePage({required this.token, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //final listingProvider = Provider.of<ListingProvider>(context, listen: true);

    //print(listingProvider.onDisplayListing);

    Future<ListingResponse?> getData() async {
      var url = Uri.parse('${Constants.apiUrl}listings/');

      var response = await http.get(
        url,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': "Bearer ${widget.token.token}"
        },
      );

      final nowListingResponse = ListingResponse.fromJson(response.body);

      return nowListingResponse;

      //print(nowListingResponse.results);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Shipments"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<ListingResponse?> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("no data"),
            );
          } else {
            print(snapshot.data!.results);
            return _Listings(snapshot.data!.results);
          }
        },
      ),
    );
  }

  //

  Widget myDrawerListOption() {
    return Column(
      children: [
        ListTile(
          title: const Text('Your Trips'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('My Account'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAccountPage(
                          token: widget.token,
                        )));
          },
        ),
        ListTile(
          title: const Text('Payments'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentPage(
                          token: widget.token,
                        )));
          },
        ),
        ListTile(
          title: const Text('Lo Out'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}

class _Listings extends StatelessWidget {
  final List<Listing> _listings;

  const _Listings(this._listings);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _listings.length,
        itemBuilder: (context, index) {
          final listing = _listings[index];
          return ListTile(
            title: Text(listing.title),
          );
        });
  }
}
