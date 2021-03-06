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

class BookedListingDetail extends StatefulWidget {
  final Listing listing;
  final Token token;

  const BookedListingDetail(
      {Key? key, required this.listing, required this.token})
      : super(key: key);

  @override
  State<BookedListingDetail> createState() => _BookedListingDetailState();
}

class _BookedListingDetailState extends State<BookedListingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Listing Booked'),
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  widget.listing.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            getUserByListing(),
            const Divider(),
            const Text(
              "Quantity",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Text(widget.listing.quantity),
            const Divider(),
          ],
        ),
      ),
      bottomNavigationBar: MaterialButton(
        //minWidth: 10.0,
        elevation: 10,
        height: 100,
        color: const Color.fromARGB(255, 0, 82, 26),
        child: const Text('Entregado',
            style: TextStyle(
                fontSize: 26.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        onPressed: () {
          markAsDelivered('delivered');
        },
      ),
    );
  }

  Future<void> markAsDelivered(
    final String _status,
  ) async {
    Map<String, dynamic> request = {
      "status": _status,
    };
    //print("AQUIIII: " + widget.id);

    //var url = Uri.parse('${Constants.apiUrl}listings/${token.user.id}/vehicle');
    var url = Uri.parse('${Constants.apiUrl}listings/${widget.listing.id}');

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
