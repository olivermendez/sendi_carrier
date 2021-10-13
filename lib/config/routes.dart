import 'package:flutter/material.dart';
import 'package:sendi_carriers/pages/welcome_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/welcome':
        return WelcomeScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Error Page"),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
