import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("testing widgets"),
      ),
      body: Card1(),
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
