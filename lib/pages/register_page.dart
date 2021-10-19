import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sendi_carriers/config/constant.dart';
import 'package:sendi_carriers/pages/login_page.dart';

import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const String routenName = '/register';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const RegisterPage(),
        settings: const RouteSettings(name: routenName));
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //bool? _obscurePassword;
  //bool? _autovalidate;
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cedulaController = TextEditingController();
  final String _role = "carrier";
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  void userRegister(String name, String username, String email, String cedula,
      String role, String password, String phoneNumer) async {
    Map<String, dynamic> request = {
      "name": name,
      "username": username,
      "email": email,
      "phone": phoneNumer,
      "cedula": cedula,
      "role": role,
      "password": password
    };

    var url = Uri.parse('${Constants.apiUrl}auth/register');

    var response = await http.post(
      url,
      body: jsonEncode(request),
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json'
      },
    );

    print(response.body);
  }

  //@override
  //void initState() {
  //  super.initState();
  //_obscurePassword = true;
  //  _emailController = TextEditingController();
  //  _passwordController = TextEditingController();
  //  _phoneNumberController = TextEditingController();
  //}

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    _nameController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Register Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(37, 59, 128, 5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _regiterForm(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _regiterForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //NAME

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Your name',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
              controller: _nameController,
              keyboardType: TextInputType.name,
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),

            //USERNAME
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'username',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please define your username";
                }
                return null;
              },
              controller: _usernameController,
              keyboardType: TextInputType.name,
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),

            //EMAIL AREA
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),

            //PHONE
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'phone number',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please define your username";
                }
                return null;
              },
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),

            //CEDULA
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Cedula',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please define your cedula";
                }
                return null;
              },
              controller: _cedulaController,
              keyboardType: TextInputType.text,
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),

            //PASSWORD AREA
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              obscureText: true,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              //autocorrect: false,
            ),

            const SizedBox(
              height: 12,
            ),

            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    userRegister(
                        _nameController.text,
                        _usernameController.text,
                        _emailController.text,
                        _cedulaController.text,
                        _role,
                        _passwordController.text,
                        _phoneNumberController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Registered"),
                      backgroundColor: Colors.green,
                    ));

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 17),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text("Are you user ?, Login Now"))
          ],
        ),
      ),
    );
  }
}
