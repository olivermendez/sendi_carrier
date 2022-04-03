import 'package:flutter/material.dart';

import 'login_page.dart';

class NoCarrierAdvice extends StatelessWidget {
  const NoCarrierAdvice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("No estas registrado como Carrier"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text("Haz login como carrier"))
        ],
      ),
    );
  }
}
