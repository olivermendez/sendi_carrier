import 'package:flutter/material.dart';

class MyShipments extends StatefulWidget {
  const MyShipments({Key? key}) : super(key: key);

  @override
  _MyShipmentsState createState() => _MyShipmentsState();
}

class _MyShipmentsState extends State<MyShipments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Shipments"),
        ),
        body: const Center(
          child: Text("My Shipments"),
        ));
  }
}
