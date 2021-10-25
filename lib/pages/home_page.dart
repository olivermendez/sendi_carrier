// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/constant.dart';
import 'package:sendi_carriers/models/listing_response.dart';
import 'package:sendi_carriers/models/token.dart';
import 'package:sendi_carriers/pages/my_account_page.dart';
import 'package:sendi_carriers/pages/payments_page.dart';
import 'package:sendi_carriers/widgets/drawer_header.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final Token token;
  const HomePage({required this.token, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListingResponse> _listing = [];

  @override
  initState() {
    super.initState();
    _getListing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Shipments"),
      ),
      body: Center(
        child: Text("Hola ${widget.token.user.name}!"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            MyHeaderDrawer(
              token: widget.token,
            ),
            myDrawerListOption(),
          ],
        ),
      ),
    );
  }

  void _getListing() async {
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

    print(nowListingResponse.results[0].title);
  }

  Widget _getContent() {
    return _listing.length == 0 ? _noContent() : _getListViewListing();
  }

  Widget _noContent() {
    return Center(
      child: Text("no content"),
    );
  }

  Widget _getListViewListing() {
    return Container();
  }

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
