import 'package:flutter/material.dart';

import '../../models/listing/listing.dart';
import '../../models/user/get_user_listing.dart';
import '../../providers/data_services.dart';
import '../../widgets/app_bar/custom_appBar.dart';

class BookedListingDetail extends StatelessWidget {
  final Listing listing;

  const BookedListingDetail({Key? key, required this.listing})
      : super(key: key);

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
                  image: NetworkImage(listing.photo),
                )),
            Text(listing.title),
            Text(
              listing.description,
              style: const TextStyle(color: Colors.grey),
            ),
            getUserByListing(),
            const Divider(),
            const Text(
              "Quantity",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            Text(listing.quantity),
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
        onPressed: () {},
      ),
    );
  }

  Widget getUserByListing() {
    return FutureBuilder(
      future: DataServices.getUserByListing(listing),
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
