import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/listing/listing.dart';

class AcceptListingPage extends StatefulWidget {
  final Listing listing;
  const AcceptListingPage({required this.listing, Key? key}) : super(key: key);

  @override
  _AcceptListingPageState createState() => _AcceptListingPageState();
}

class _AcceptListingPageState extends State<AcceptListingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Acepted"),
    ));
  }
}
