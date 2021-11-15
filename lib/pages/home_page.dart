import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/constant.dart';
import 'package:sendi_carriers/models/listing.dart';
import 'package:sendi_carriers/models/listing_response.dart';
import 'package:sendi_carriers/models/token.dart';
import 'package:sendi_carriers/pages/my_account_page.dart';
import 'package:sendi_carriers/pages/payments_page.dart';

import 'package:http/http.dart' as http;
import 'package:sendi_carriers/pages/test.dart';

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
        //ackgroundColor: Colors.deepPurple[300],
        elevation: 9,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
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
                            /*
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(listing.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )
                            */
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

class CardsListing extends StatelessWidget {
  final Listing listing;
  CardsListing({required this.listing});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
