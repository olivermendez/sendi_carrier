import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/token.dart';

class MyAccountPage extends StatefulWidget {
  final Token token;
  const MyAccountPage({required this.token, Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Account'),
      ),
    );
  }
}
