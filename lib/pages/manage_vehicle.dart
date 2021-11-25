import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManageVehicle extends StatefulWidget {
  const ManageVehicle({Key? key}) : super(key: key);

  @override
  _ManageVehicleState createState() => _ManageVehicleState();
}

class _ManageVehicleState extends State<ManageVehicle> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String? vehicle;
  @override
  Widget build(BuildContext context) {
    //final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Vehicle",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 2,
      ),
      key: _scaffoldKey,
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return ListView(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                        maxHeight: viewportConstraints.maxHeight),
                    child: Column(
                      children: [
                        //ListView
                        Expanded(
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              //Vehicle Type
                              InkWell(
                                onTap: () {
                                  /* FocusScope.of(context).requestFocus(FocusNode());
                                          _awaitReturnValueFromSelectVehicleScreen(context); */
                                },
                                child: Container(
                                  height: 56,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xFFEDEDED)))),
                                  child: Stack(
                                    children: [
                                      const Positioned(
                                        left: 0,
                                        top: 8,
                                        child: Text(
                                          "Vehicle Type",
                                          style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.only(top: 25),
                                          hintText: vehicle ?? "Select Vehicle",
                                          hintStyle: const TextStyle(
                                              color: Color(0xFF787878),
                                              fontSize: 13,
                                              fontFamily: 'medium'),
                                        ),
                                      ),
                                      Positioned(
                                          right: -21,
                                          top: 0,
                                          bottom: 0,
                                          child: Image.asset(
                                            "assets/newIcons/ic_forward.png",
                                            scale: 5.3,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              //Manufacture
                              Container(
                                height: 56,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFFEDEDED)))),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 8,
                                      child: Container(
                                        child: Text(
                                          "Manufacture",
                                          style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      cursorColor: Color(0xFFF54D6E),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 25),
                                        hintText: "Enter Manufacture Company",
                                        hintStyle: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: 13,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Model
                              Container(
                                height: 56,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFFEDEDED)))),
                                child: Stack(
                                  children: [
                                    const Positioned(
                                      left: 0,
                                      top: 8,
                                      child: Text(
                                        "Model",
                                        style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      cursorColor: Color(0xFFF54D6E),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 25),
                                        hintText: "Enter Model Number",
                                        hintStyle: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: 13,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Year
                              Container(
                                height: 56,
                                padding: EdgeInsets.symmetric(horizontal: 18.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFFEDEDED)))),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 8,
                                      child: Text(
                                        "Year",
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 12,
                                            fontFamily: 'medium'),
                                      ),
                                    ),
                                    TextFormField(
                                      cursorColor: Color(0xFFF54D6E),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 25),
                                        hintText: "Enter Year of Manufacture",
                                        hintStyle: TextStyle(
                                            color: Color(0xFF787878),
                                            fontSize: 13,
                                            fontFamily: 'medium'),
                                      ),
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 13,
                                          fontFamily: 'medium'),
                                    ),
                                  ],
                                ),
                              ),
                              //License Plate
                              Container(
                                height: 56,
                                padding: EdgeInsets.symmetric(horizontal: 18.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFFEDEDED)))),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 8,
                                      child: Container(
                                        child: Text(
                                          "License Plate",
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontSize: 12,
                                              fontFamily: 'medium'),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      cursorColor: Color(0xFFF54D6E),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 25),
                                        hintText: "Enter License Plate",
                                        hintStyle: TextStyle(
                                            color: Color(0xFF787878),
                                            fontSize: 13,
                                            fontFamily: 'medium'),
                                      ),
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontSize: 13,
                                          fontFamily: 'medium'),
                                    ),
                                  ],
                                ),
                              ),
                              //Color
                              Container(
                                height: 54,
                                padding: EdgeInsets.symmetric(horizontal: 18.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFFEDEDED)))),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 8,
                                      child: Container(
                                        child: Text(
                                          "Color",
                                          style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      cursorColor: Color(0xFFF54D6E),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 25),
                                        hintText: "Enter Vehical Color",
                                        hintStyle: TextStyle(
                                          color: Color(0xFF787878),
                                          fontSize: 13,
                                        ),
                                      ),
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Submit Button
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  height: 44,
                                  onPressed: () {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    //     Navigator.of(context).push(_verificationCodeScreenRoute());
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                  color: Colors.blue,
                                  elevation: 0,
                                  highlightElevation: 0,
                                  child: const Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  /* void _awaitReturnValueFromSelectVehicleScreen(BuildContext context) async{
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.of(
      context,).push(_selectVehicleRoute());
    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      vehicle = result;
    });
  } */

  //_selectVehicleRoute
  /* Route _selectVehicleRoute() {
    return  PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SelectVehicle(),
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve),);

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  } */
}
