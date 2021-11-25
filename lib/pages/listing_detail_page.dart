import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/listing.dart';
import 'package:sendi_carriers/pages/accept_listing_page.dart';

class DetailPageListing extends StatefulWidget {
  const DetailPageListing({Key? key}) : super(key: key);

  static const String routenName = 'detail';

  @override
  _DetailPageListingState createState() => _DetailPageListingState();
}

class _DetailPageListingState extends State<DetailPageListing> {
  @override
  Widget build(BuildContext context) {
    final Listing listing =
        ModalRoute.of(context)!.settings.arguments as Listing;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(listing),
          SliverList(
            delegate: SliverChildListDelegate([
              ListingTitle(listing),
              ListingDetails(
                listing: listing,
              ),
              const Divider(),
              FromToDestination(
                listing: listing,
              ),
              ButtonActionOnListing(
                listing: listing,
              )
            ]),
          )
        ],
      ),
    );
  }
}

class ListingTitle extends StatelessWidget {
  final Listing listing;

  ListingTitle(this.listing, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        listing.title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Listing listing;

  const _CustomAppBar(this.listing);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      //title: const Text(
      //  "Listing Details",
      //  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      // s),

      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(listing.photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PrimaryImageListing extends StatelessWidget {
  final Listing listing;
  const PrimaryImageListing({required this.listing, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 400,
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            //image: NetworkImage('https://via.placeholder.com/300x200'),
            image: NetworkImage(listing.photo),
            fit: BoxFit.cover,
          ),
        ));
  }
}

class ListingDetails extends StatelessWidget {
  final Listing listing;
  const ListingDetails({required this.listing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Listing Expires in 6d 23 h",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Color(0xFF787878),
            ),
          ),
          Text(
            "Total Amount: \$545 ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Column(children: [
            SizedBox(
              height: 30,
              child: Stack(
                children: const [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      "Pickup information",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Text(
                  "John Doe",
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  "+1 347-272-0544",
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 12,
                    fontFamily: 'medium',
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  "john@gmail.com",
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 12,
                    fontFamily: 'medium',
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  "50 Bayard St, New York, NY 10013, United States",
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontSize: 12,
                    fontFamily: 'medium',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
          ]),
          Column(
            children: [
              //1st Row
              SizedBox(
                height: 30,
                child: Stack(
                  children: const [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        "Delivery information",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //2nd Row
              Row(
                children: const [
                  Text(
                    "Sarah Joseph",
                    style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 12,
                      fontFamily: 'medium',
                    ),
                  ),
                ],
              ),
              //3rd Row
              Row(
                children: const [
                  Text(
                    "+1 321-212-0544",
                    style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 12,
                      fontFamily: 'medium',
                    ),
                  ),
                ],
              ),
              //4th Row
              Row(
                children: const [
                  Text(
                    "sarah@gmail.com",
                    style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 12,
                      fontFamily: 'medium',
                    ),
                  ),
                ],
              ),
              //5th Row
              Row(
                children: const [
                  Text(
                    "261 Broadway, New York, NY 10007, United States",
                    style: TextStyle(
                      color: Color(0xFF787878),
                      fontSize: 12,
                      fontFamily: 'medium',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonActionOnListing extends StatelessWidget {
  final Listing listing;
  const ButtonActionOnListing({required this.listing, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: MaterialButton(
          color: Colors.blue[900],
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AcceptListingPage(listing: listing)));
          },
          child: const Text(
            'Accept Listing',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class FromToDestination extends StatelessWidget {
  final Listing listing;
  const FromToDestination({required this.listing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "From: ",
          ),
          trailing: const Icon(Icons.south_east, color: Colors.blue),
        ),
        ListTile(
          title: Text(
            "To ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.north_east, color: Colors.blue),
        )
      ],
    );
  }
}
