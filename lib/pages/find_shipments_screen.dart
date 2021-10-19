import 'package:flutter/material.dart';

//import 'package:sendi_carriers/models/commodities_model.dart';
//import 'package:sendi_carriers/services/find_shipments.dart';

class FindShipments extends StatefulWidget {
  const FindShipments({Key? key}) : super(key: key);

  @override
  State<FindShipments> createState() => _FindShipmentsState();
}

class _FindShipmentsState extends State<FindShipments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenido "),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Container(
          height: 100,
          color: Colors.red,
        );
      }),
    );
  }
}
