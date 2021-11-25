import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool isOnline = false;
  void toggle() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  Future<File?> openGallery() async {
    // ignore: deprecated_member_use
    File picture = (await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50)) as File;
    setState(() {
      _imageFile = picture;
    });
  }

  var selected;
  var countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20),
        ),
        elevation: 9,
      ),
      key: _scaffoldKey,
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          //Profile Scetion
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: <Widget>[
                //Prof Img
                InkWell(
                  onTap: () {
                    openGallery();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1, color: const Color(0xFF000000)),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: (_imageFile == null)
                              ? Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "assets/newIcons/ic_newProfile.png"))),
                                )
                              : Image.file(
                                  _imageFile!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        Positioned(
                          right: -1,
                          bottom: -1,
                          width: 15,
                          height: 15,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xFFFFFFFF)),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/newIcons/ic_edit.png"))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                //Prof Name
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 12, fontFamily: 'medium', height: 1.2),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Amir Sheikh",
                          style: TextStyle(
                              color: Color(0xFF787878),
                              fontSize: 13,
                              fontFamily: 'medium'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 22,
          ),
          //ListView
          Expanded(
            child: ListView(
              children: [
                //Phone Number
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 18, right: 8),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFEDEDED)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 12,
                                  fontFamily: 'medium'),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              "123",
                              style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: 13,
                                  fontFamily: 'medium'),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(),
                                settings:
                                    const RouteSettings(name: '/profile')),
                          ); */
                          /* Navigator.of(context)
                                .push(_changeNumberRoute()); */
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Change",
                            style: TextStyle(
                              color: Color(0xFFF54D6E),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Email
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 18, right: 8),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFEDEDED)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              "hello@s.com",
                              style: TextStyle(
                                color: Color(0xFF787878),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          //Navigator.of(context).push(_changeEmailRoute());
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Change",
                            style: TextStyle(
                                color: Color(0xFFF54D6E),
                                fontSize: 12,
                                fontFamily: 'medium'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Country
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 18, right: 8),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFEDEDED)))),
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Country",
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontFamily: 'medium'),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                selected == null ? "Select Country" : selected,
                                style: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: 13,
                                    fontFamily: 'medium'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            "Change",
                            style: TextStyle(
                                color: Color(0xFFF54D6E),
                                fontSize: 12,
                                fontFamily: 'medium'),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          child: Theme(
                            data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            child: CountryCodePicker(
                              padding: EdgeInsets.only(right: 65),
                              onChanged: (country) {
                                setState(() {
                                  selected = country.name;
                                  countryCode = country.dialCode;
                                });
                              },
                              initialSelection: 'PK',
                              favorite: ['+92', 'PK'],
                              showCountryOnly: true,
                              showOnlyCountryWhenClosed: false,
                              showFlag: false,
                              showFlagDialog: true,
                              alignLeft: false,
                              textStyle: TextStyle(
                                color: Colors.transparent,
                                fontSize: 13,
                                fontFamily: "narrownews",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Online Status
                InkWell(
                  onTap: () {
                    toggle();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 18, right: 7),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xFFEDEDED)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "Online Status",
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 12,
                                    fontFamily: 'medium'),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: Text(
                                isOnline ? "Online" : "Offline",
                                style: TextStyle(
                                    color: Color(0xFF787878),
                                    fontSize: 13,
                                    fontFamily: 'medium'),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 2),
                            padding: EdgeInsets.all(10),
                            child: isOnline
                                ? Image.asset(
                                    "assets/newIcons/ic_switchOn.png",
                                    scale: 3,
                                  )
                                : Image.asset(
                                    "assets/newIcons/ic_switchOff.png",
                                    scale: 3,
                                  ))
                      ],
                    ),
                  ),
                ),
                //Member Since
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 18, right: 8),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFEDEDED)))),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Member Since",
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 12,
                                  fontFamily: 'medium'),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              "May 2020",
                              style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontSize: 13,
                                  fontFamily: 'medium'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
