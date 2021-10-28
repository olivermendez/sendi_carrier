import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/constant.dart';
import 'package:sendi_carriers/models/listing.dart';
import 'package:sendi_carriers/models/listing_response.dart';
import 'package:sendi_carriers/models/token.dart';
import 'package:sendi_carriers/pages/my_account_page.dart';
import 'package:sendi_carriers/pages/payments_page.dart';

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
          icon: Icon(Icons.menu),
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

          //var cardImage
          return Card(
              elevation: 10.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(listing.title),
                    subtitle: Text(listing.price.toString()),
                    trailing: const Icon(Icons.favorite_outline),
                  ),
                  SizedBox(
                    height: 100.0,
                    child: Ink.image(
                      image: NetworkImage(listing.photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.north_east),
                          subtitle: Text(
                            listing.addressFrom,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.south_east),
                          subtitle: Text(
                            listing.addressTo,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        child: const Text('CONTACT AGENT'),
                        onPressed: () {/* ... */},
                      ),
                      TextButton(
                        child: const Text('LEARN MORE'),
                        onPressed: () {
                          Navigator.pushNamed(context, 'detail',
                              arguments: _listings[index]);
                        },
                      )
                    ],
                  )
                ],
              ));
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
