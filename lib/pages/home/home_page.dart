import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/listing/listing.dart';
import 'package:sendi_carriers/models/listing/listing_response.dart';
//import 'package:sendi_carriers/models/user/get_user_listing.dart';
import 'package:sendi_carriers/models/user/token.dart';
//import 'package:sendi_carriers/models/user/user_model.dart';
//import 'package:sendi_carriers/pages/my_account_page.dart';

import 'package:sendi_carriers/providers/data_services.dart';
import 'package:sendi_carriers/widgets/app_bar/custom_appBar.dart';
import 'package:sendi_carriers/widgets/my_drawer.dart';

import '../listing_detail/delivered_listing_details.dart';
import '../listing_detail/listing_detail_page.dart';
import '../listing_detail/booked_listing_details.dart';

class HomePage extends StatefulWidget {
  final Token token;
  const HomePage({required this.token, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/deliver.png'),
                fit: BoxFit.scaleDown,
                alignment: Alignment.bottomRight,
              )),
            ),
            backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
            title: const Text(
              "Find Shipments",
              style: TextStyle(fontSize: 20),
            ),
            bottom: const TabBar(
                labelColor: Colors.white,
                indicatorWeight: 5,
                labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Processing',
                  ),
                  Tab(
                    text: 'Delivered',
                  )
                ]),
            elevation: 3,
          ),
          drawer: MyDrawer(token: widget.token),
          body: TabBarView(children: [
            getNewListing(),
            bookedListing(),
            deliveredListing(),
          ])),
    );
  }

  Widget getNewListing() {
    return FutureBuilder(
      future: DataServices.getNewListing(widget.token),
      builder: (context, AsyncSnapshot<ListingResponse?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return _Listings(snapshot.data!.listing, widget.token);
        }
      },
    );
  }

  Widget bookedListing() {
    const status = 'Booked';
    return FutureBuilder(
      future: DataServices.getBookedListing(widget.token),
      builder: (context, AsyncSnapshot<ListingResponse?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data!.listing.isEmpty) {
          return noListingFound(status);
        } else {
          return _Listings(snapshot.data!.listing, widget.token);
        }
      },
    );
  }

  Widget deliveredListing() {
    const status = 'Delivered';
    return FutureBuilder(
      future: DataServices.getDeliveredListing(widget.token),
      builder: (context, AsyncSnapshot<ListingResponse?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.data!.listing.isEmpty) {
          return noListingFound(status);
        } else {
          return _Listings(snapshot.data!.listing, widget.token);
        }
      },
    );
  }

  Widget noListingFound(String status) {
    return Center(
        child: Text(
      "No $status listing",
    ));
  }
}

class _Listings extends StatelessWidget {
  final List<Listing> listing;
  final Token token;

  const _Listings(this.listing, this.token);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listing.length,
        itemBuilder: (context, index) {
          final opt = listing[index];
          return Card(
            elevation: 1,
            child: ListTile(
                title: Text(opt.title),
                subtitle: Text(
                  opt.comodity,
                  style: const TextStyle(fontSize: 15),
                ),
                trailing: Text(
                  opt.status,
                  style: const TextStyle(fontSize: 15),
                ),
                leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 64,
                      minHeight: 64,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(opt.photo),
                    )),
                onTap: () {
                  switch (opt.status) {
                    case 'booked':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookedListingDetail(
                                    listing: opt,
                                    token: token,
                                  )));
                      break;

                    case 'active':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPageListing(
                                    listing: opt,
                                    token: token,
                                  )));

                      break;

                    case 'delivered':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliveredListingDetail(
                                    listing: opt,
                                    token: token,
                                  )));

                      break;

                    default:
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StatusNoDefined()));
                  }
                }),
          );
        });
  }
}

class StatusNoDefined extends StatelessWidget {
  const StatusNoDefined({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: CustomAppBar(title: 'status no defined'),
    );
  }
}
