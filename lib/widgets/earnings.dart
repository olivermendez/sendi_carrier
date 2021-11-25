import 'package:flutter/material.dart';

Widget totalEarningNCompletedOrders(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18.0),
    child: Row(
      children: [
        //Total Earnings
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                //1st Row

                //2nd Row
                Positioned(
                  left: 8,
                  top: 20,
                  child: Container(
                    child: Text(
                      "TOTAL EARNINGS",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //3rd Row
                Positioned(
                  left: 8,
                  top: 33,
                  child: const Text(
                    "\$2500.95",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'medium'),
                  ),
                ),
                //4th Row
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    height: 25,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(color: Colors.black12),
                    child: Text(
                      "USD",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 12,
                          fontFamily: 'regular'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        //Completed Orders
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: const [
                //2nd Row
                Positioned(
                  left: 8,
                  top: 20,
                  child: Text(
                    "COMPLETED ORDERS",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //3rd Row
                Positioned(
                  left: 8,
                  top: 40,
                  child: Text(
                    "103",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 31,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
