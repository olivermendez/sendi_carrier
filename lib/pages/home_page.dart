import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/constant.dart';
import 'package:sendi_carriers/models/listing.dart';
import 'package:sendi_carriers/models/listing_response.dart';
import 'package:sendi_carriers/models/token.dart';
import 'package:sendi_carriers/pages/my_account_page.dart';

import 'package:http/http.dart' as http;
import 'package:sendi_carriers/pages/my_drawer.dart';

class HomePage extends StatefulWidget {
  final Token token;
  const HomePage({required this.token, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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

      final nowListingResponse = ListingResponse.fromRawJson(response.body);

      return nowListingResponse;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Find Shipments",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 9,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyAccountPage(token: widget.token)));
                print(widget.token.token);
              },
              icon: const Icon(Icons.person))
        ],
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<ListingResponse?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _Listings(snapshot.data!.listing);
          }
        },
      ),
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

          //var cardImage
          return Center(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 0.6,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail',
                          arguments: _listings[index]);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.network(
                              listing.photo,
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 16, right: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listing.title,
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                listing.title,
                                style: const TextStyle(fontSize: 13),
                              ),
                              Text(listing.user,
                                  style: const TextStyle(fontSize: 13))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
