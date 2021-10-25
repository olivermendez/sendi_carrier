import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/routes.dart';
import 'package:sendi_carriers/config/theme.dart';
import 'package:sendi_carriers/pages/welcome_login_register/welcome_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sendi Carrier',
      theme: themeCarrier(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
