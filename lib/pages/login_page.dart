import 'package:flutter/material.dart';

import 'home_screen.dart';

//import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routenName = '/login';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LoginPage(),
        settings: const RouteSettings(name: routenName));
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //bool? _obscurePassword;
  //bool? _autovalidate;
  //TextEditingController? _emailController;
  //TextEditingController? _passwordController;

  String? _email;
  String? _password;
  bool _rememberme = true;

  @override
  void initState() {
    super.initState();
    //_obscurePassword = true;
    //_emailController = TextEditingController();
    //_passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Login Page'),
        backgroundColor: const Color.fromRGBO(37, 59, 128, 5),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          _logoSendiCarrier(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _LoginForm(),
          ),
        ],
      ),
    );
  }

  Widget _logoSendiCarrier() {
    return const Text("SENDI CARRIERS");
  }

  // ignore: non_constant_identifier_names
  Widget _LoginForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //EMAIL AREA
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Insert your email',
                labelText: "Email",
                suffixIcon: Icon(Icons.email),
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              //controller: _emailController,
              onChanged: (value) {
                _email = value;
              },
              //controller: _emailController,
              autocorrect: false,
            ),
            const SizedBox(
              height: 12,
            ),

            //PASSWORD AREA
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: "Insert your password",
                filled: true,
                isDense: true,
                suffixIcon: Icon(Icons.account_box),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              onChanged: (value) {
                _password = value;
              },
              obscureText: true,
              //controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              //autocorrect: false,
            ),

            const SizedBox(
              height: 12,
            ),

            CheckboxListTile(
                title: const Text("Rememberme"),
                value: _rememberme,
                onChanged: (value) {
                  setState(() {
                    _rememberme = value!;
                  });
                }),

            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Logged"),
                      backgroundColor: Colors.green,
                    ));
                  }

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text("Login Now")),
            const SizedBox(
              height: 10,
            ),

            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text("Are you new user ?, Register Now"))
          ],
        ),
      ),
    );
  }
}
