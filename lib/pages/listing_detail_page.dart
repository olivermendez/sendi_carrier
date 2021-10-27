import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/listing.dart';

class DetailPageListing extends StatefulWidget {
  final List<Listing> listings;

  DetailPageListing({required this.listings});

  @override
  _DetailPageListingState createState() => _DetailPageListingState();
}

class _DetailPageListingState extends State<DetailPageListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
    );
  }
}
