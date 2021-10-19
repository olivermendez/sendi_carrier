import 'package:flutter/material.dart';

ThemeData themeCarrier() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      // ignore: deprecated_member_use
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),

      backgroundColor: Color.fromRGBO(37, 59, 128, 5),
      elevation: 0,
    ),
    primaryColor: Colors.lightBlue[900],
    primaryColorDark: const Color(0xFFFC0026),
    primaryColorLight: const Color(0xFFFE9AAA),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color.fromRGBO(37, 59, 128, 5),
    //fontFamily: 'Futura',
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline4: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      headline6: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 20,
      ),
    ),
  );
}
