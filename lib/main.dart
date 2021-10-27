import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sendi_carriers/config/theme.dart';
import 'package:sendi_carriers/pages/listing_detail_page.dart';
import 'package:sendi_carriers/pages/welcome_login_register/welcome_screen.dart';
import 'package:sendi_carriers/providers/listing_provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  //const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ListingProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sendi Carrier',
      theme: themeCarrier(),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        'welcome': (_) => const WelcomeScreen(),
        'detail': (_) => DetailPageListing()
      },
    );
  }
}
