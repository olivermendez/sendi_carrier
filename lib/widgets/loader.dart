import 'package:flutter/material.dart';

class LoaderComponent extends StatelessWidget {
  //const LoaderComponent({Key? key}) : super(key: key);

  final String text;
  // ignore: use_key_in_widget_constructors
  const LoaderComponent({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
