import 'package:flutter/material.dart';
import 'package:sendi_carriers/pages/manage_vehicle.dart';
import 'package:sendi_carriers/pages/profile.dart';

import 'my_documents.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Drawer(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 55,
              ),
              //Profile Scetion
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    //Prof Img
                    Container(
                      height: 49,
                      width: 49,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 1, color: Color(0xFF000000)),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "assets/newIcons/ic_newProfile.png"))),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 1.5,
                            bottom: 1,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xFFFFFFFF)),
                                  color: Color(0xFF787878),
                                  shape: BoxShape.circle),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 10,
                    ),
                    //Prof Name
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Text(
                              "Amir Sheikh",
                              style:
                                  TextStyle(fontSize: 13, fontFamily: 'medium'),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  "Offline",
                                  style: TextStyle(
                                      color: Color(0xFF787878),
                                      fontSize: 12,
                                      fontFamily: 'medium'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              //items
              Container(
                child: Column(
                  children: [
                    //Home
                    InkWell(
                      onTap: () {
                        /* Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context)=>MyOrders()
                        ), (route) => false); */
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFEDEDED)))),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/newIcons/ic_home.png",
                              scale: 5,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                //fontFamily: 'medium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //My profile
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFEDEDED)))),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/newIcons/ic_profile.png",
                              scale: 5,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                "My Profile",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'medium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //Manage Vehicle
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ManageVehicle()));
                        /* Navigator.pop(context);
                        Navigator.of(context).push(_manageVehicleScreenRoute()); */
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFEDEDED)))),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/newIcons/ic_vehicle.png",
                              scale: 5,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                "Manage Vehicle",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'medium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //Documents
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyDocuments()));
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFEDEDED)))),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/newIcons/ic_document.png",
                              scale: 5,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                "Documents",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'medium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //History
                    InkWell(
                      onTap: () {
                        /* Navigator.pop(context);
                        Navigator.of(context).push(_historyScreenRoute()); */
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFEDEDED)))),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/newIcons/ic_history.png",
                              scale: 5,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                "History",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'medium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //Setting
                    InkWell(
                      onTap: () {
                        /* Navigator.pop(context);
                        Navigator.of(context).push(_settingScreenRoute()); */
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFEDEDED)))),
                        child: Row(
                          children: [
                            Image.asset("assets/newIcons/ic_setting.png",
                                scale: 5),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                "Setting",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'medium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //Logout
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFEDEDED)))),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/newIcons/ic_logout.png",
                              scale: 5,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'medium'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Version
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 25),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "V 1.5",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'medium',
                        color: Color(0xFF787878)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
