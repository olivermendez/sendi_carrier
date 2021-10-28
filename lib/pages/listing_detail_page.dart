import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/listing.dart';

class DetailPageListing extends StatefulWidget {
  const DetailPageListing({Key? key}) : super(key: key);

  static const String routenName = 'detail';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const DetailPageListing(),
        settings: const RouteSettings(name: routenName));
  }

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
              Divider(),
              FromToDestination(
                listing: listing,
              ),
              const ButtonActionOnListing()
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
    // ignore: prefer_const_constructors
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Text(
            "Listing Expires in 6d 23 h",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Text(
            "Offer " + listing.price.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
            title: const Text(
              "Listing Question ?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.question_answer, color: Colors.blue),
            onTap: () {}),
        const Divider(
          color: Colors.black,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Listing Details",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            children: [
              Text("Height: " + listing.heightInMeters.toString() + "M"),
              Text("Length: " + listing.lengthInMeters.toString() + "M"),
              Text(
                "Weigh:" + listing.weightInGrams.toString() + " Grams",
              ),
              Text(
                "Width:   " + listing.widthInMeters.toString() + "M",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonActionOnListing extends StatelessWidget {
  const ButtonActionOnListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        child: MaterialButton(
          color: Colors.blue[900],
          onPressed: () {},
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
            "From: " + listing.addressFrom,
          ),
          trailing: const Icon(Icons.south_east, color: Colors.blue),
        ),
        ListTile(
          title: Text(
            "To " + listing.addressTo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.north_east, color: Colors.blue),
        )
      ],
    );
  }
}
