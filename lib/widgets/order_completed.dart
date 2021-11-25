import 'package:flutter/material.dart';

Widget recentOrderDetails(context) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext ctxt, int index) {
        return new Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
          child: InkWell(
            onTap: () {
              //Navigator.of(context).push(_detailsRoute());
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                height: 127,
                child: Stack(
                  children: [
                    //1st Row
                    Positioned(
                      left: 13,
                      top: 14,
                      right: 0,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Order #1234",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              width: 66,
                              height: 16,
                              decoration: BoxDecoration(
                                  color: Color(0xFF388E3C),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      bottomLeft: Radius.circular(50))),
                              child: Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Image.asset(
                                        "assets/newIcons/ic_delivered.png",
                                        scale: 8.3,
                                      )),
                                  Container(
                                    child: Text(
                                      " Delivered",
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'medium',
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Deliverd

                    //2nd Row
                    Positioned(
                      left: 12,
                      top: 40,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Name: ",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "John Doe",
                                style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //3rd Row
                    Positioned(
                      left: 12,
                      bottom: 40,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Delivery Time:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                " 10 June 3 Pm",
                                style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    //4th Row
                    Positioned(
                      left: 12,
                      bottom: 14,
                      child: Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Pickup Location:",
                                style: TextStyle(
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 2,
                              child: Text(
                                " 781 Eastern Pkwy, Brooklyn Ny ...",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF787878),
                                  fontFamily: 'medium',
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
