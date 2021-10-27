import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/listing.dart';

class DetailPageListing extends StatefulWidget {
  DetailPageListing({Key? key}) : super(key: key);

  static const String routenName = 'detail';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => DetailPageListing(),
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
            ]),
          )
        ],
      ),
    );
  }
}

class ListingTitle extends StatelessWidget {
  //const ListingTitle({Key? key}) : super(key: key);
  final Listing listing;

  ListingTitle(this.listing);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        listing.title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      // ignore: prefer_const_constructors
      flexibleSpace: FlexibleSpaceBar(
        //titlePadding: EdgeInsets.all(0),
        //centerTitle: true,
        //title: Text(listing.title),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(listing.photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/400x400'),
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }
}
