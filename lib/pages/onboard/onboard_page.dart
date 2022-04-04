import 'package:flutter/material.dart';
import 'package:sendi_carriers/pages/welcome_login_register/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  static const String routeName = 'onboard';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const OnboardingPage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sendi", style: TextStyle(color: Colors.white)),
            const Text(
              "CARRIER",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            _showNeedHelpButton(context)
          ],
        ),
      ),
    );
  }
}

Widget _showNeedHelpButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
    child: Material(
      //Wrap with Material
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      elevation: 18.0,
      color: const Color.fromARGB(255, 0, 67, 166),
      clipBehavior: Clip.antiAlias, // Add This
      child: MaterialButton(
        minWidth: 200.0,
        height: 35,
        color: const Color.fromARGB(255, 0, 67, 166),
        child: const Text('EMPEZAR',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
      ),
    ),
  );
}
