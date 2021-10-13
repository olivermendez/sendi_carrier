import 'package:flutter/material.dart';

import 'find_shipments_screen.dart';
import 'my_account_screen.dart';
import 'my_notifications.dart';
import 'my_shipments_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _screenSelected = 0;

  final _screens = [
    const FindShipments(),
    const MyShipments(),
    const MyNotifications(),
    const MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: _screens
              .asMap()
              .map(
                (i, screen) => MapEntry(
                  i,
                  Offstage(offstage: _screenSelected != i, child: screen),
                ),
              )
              .values
              .toList()),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _screenSelected,
        onTap: (i) => setState(() => _screenSelected = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            activeIcon: Icon(Icons.view_list),
            label: 'My Shipments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
