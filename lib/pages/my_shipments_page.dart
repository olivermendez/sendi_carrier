import 'package:flutter/material.dart';

class MyShipmentsPage extends StatefulWidget {
  const MyShipmentsPage({Key? key}) : super(key: key);

  @override
  _MyShipmentsPageState createState() => _MyShipmentsPageState();
}

class _MyShipmentsPageState extends State<MyShipmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shipments"),
      ),
      body: const Center(
        child: Text('hola'),
      ),
    );
  }
}
