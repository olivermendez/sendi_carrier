import 'dart:convert';

import 'package:flutter/material.dart';

import '../../config/constant.dart';
import '../../models/listing/listing.dart';
import '../../models/user/get_user_listing.dart';
import '../../models/user/token.dart';
import '../../providers/data_services.dart';
import '../../widgets/app_bar/custom_appBar.dart';

import 'package:http/http.dart' as http;

import '../home/home_page.dart';

class DeliveredListingDetail extends StatefulWidget {
  final Listing listing;
  final Token token;

  const DeliveredListingDetail(
      {Key? key, required this.listing, required this.token})
      : super(key: key);

  @override
  State<DeliveredListingDetail> createState() => _DeliveredListingDetailState();
}

class _DeliveredListingDetailState extends State<DeliveredListingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Listing Delivered'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 300,
                  minHeight: 300,
                  maxWidth: 300,
                  maxHeight: 300,
                ),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(widget.listing.photo),
                )),
            Text(widget.listing.title),
            Text(
              widget.listing.description,
              style: const TextStyle(color: Colors.grey),
            ),
            getUserByListing(),
            const Divider(),
            const Text(
              "Quantity",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Text(widget.listing.quantity),
            const Divider(),
            const Text("Conductor"),
            Text(widget.token.user.name),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget getUserByListing() {
    return FutureBuilder(
      future: DataServices.getUserByListing(widget.listing),
      builder: (context, AsyncSnapshot<UserDetails?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              const Divider(),
              const Text("Created by",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  )),
              Text(snapshot.data!.name,
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              Text(snapshot.data!.email,
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              Text(snapshot.data!.phone,
                  style: const TextStyle(
                    fontSize: 15,
                  )),
            ],
          );
        }
      },
    );
  }
}
