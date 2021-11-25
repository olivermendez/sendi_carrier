import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDocuments extends StatefulWidget {
  const MyDocuments({Key? key}) : super(key: key);

  @override
  _MyDocumentsState createState() => _MyDocumentsState();
}

class _MyDocumentsState extends State<MyDocuments> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<Items> list = [
    Items(title: "Driving License", subTitle: "Approved"),
    Items(title: "Vehicle Insurance", subTitle: "Pending"),
    Items(title: "Vehicle Registration", subTitle: "Approved"),
    Items(title: "National ID/Passport", subTitle: "Pending"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Documents",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 3,
      ),
      key: _scaffoldKey,
      body: Container(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: 58,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Color(0xFFEDEDED)))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${list[index].title}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                Text(
                                  "${list[index].subTitle}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF787878),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                  //Floating Action Button
                  Positioned(
                    right: 5,
                    bottom: 25,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: InkWell(
                        onTap: () {
                          /* Navigator.of(context)
                              .push(_requiredMyDocumentsScreenRoute()); */
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/newIcons/ic_upload_floating.png",
                                  ))),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Items {
  String? title;
  String? subTitle;
  Items({this.title, this.subTitle});
}
