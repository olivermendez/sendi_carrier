import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/user/token.dart';

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
        title: const Text('Account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //profile photo
              Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")),
                      shape: BoxShape.circle,
                      color: Colors.grey[200])),
              Text(
                widget.token.user.name,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Expanded(
                        child: Column(
                          children: const [
                            Text(
                              "37",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Viajes realizados",
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: const [
                            Text(
                              "8",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Following", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: const [
                            Text(
                              "56",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Valoraciones",
                                style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
