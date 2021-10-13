import 'package:flutter/material.dart';

class MyNotifications extends StatelessWidget {
  const MyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notifications"),
      ),
      body: const Center(
        child: Text("my notifications"),
      ),
    );
  }
}
