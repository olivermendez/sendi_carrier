import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/listing.dart';

class AcceptListingPage extends StatefulWidget {
  final Listing listing;
  AcceptListingPage({required this.listing, Key? key}) : super(key: key);

  @override
  _AcceptListingPageState createState() => _AcceptListingPageState();
}

class _AcceptListingPageState extends State<AcceptListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Acepted"),
    ));
  }
}
