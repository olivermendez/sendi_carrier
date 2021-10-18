import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/token.dart';

class HomePage extends StatefulWidget {
  final Token token;
  const HomePage({required this.token, Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find shipments"),
      ),
      body: Center(
        child: Text('Bievenido ${widget.token.user.name}'),
      ),
    );
  }
}
