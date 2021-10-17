import 'package:flutter/material.dart';
import 'package:sendi_carriers/pages/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/welcome';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const WelcomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: Text("Welcome"),
          ),
          const Center(
            child: Text("CARRIER"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Login')),
        ],
      ),
    );
  }
}
