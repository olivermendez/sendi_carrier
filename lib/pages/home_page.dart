import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/token.dart';
import 'package:sendi_carriers/pages/my_account_page.dart';
import 'package:sendi_carriers/pages/payments_page.dart';
import 'package:sendi_carriers/widgets/drawer_header.dart';

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
        title: const Text("Find Shipments"),
      ),
      body: Center(
        child: Text("hola ${widget.token.user.name}!"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            MyHeaderDrawer(
              token: widget.token,
            ),
            myDrawerListOption(),
          ],
        ),
      ),
    );
  }

  Widget myDrawerListOption() {
    return Column(
      children: [
        ListTile(
          title: const Text('Your Trips'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('My Account'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAccountPage(
                          token: widget.token,
                        )));
          },
        ),
        ListTile(
          title: const Text('Payments'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentPage(
                          token: widget.token,
                        )));
          },
        ),
        ListTile(
          title: const Text('Lo Out'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
