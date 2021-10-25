import 'package:flutter/material.dart';
import 'package:sendi_carriers/models/token.dart';
import 'package:sendi_carriers/pages/add_payments.dart';

class PaymentPage extends StatefulWidget {
  final Token token;
  const PaymentPage({required this.token, Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Payments"),
      ),
    );
  }
}
