import 'package:flutter/material.dart';
import 'package:sendi_carriers/pages/login_page.dart';

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
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _phoneNumberController;

  @override
  void initState() {
    super.initState();
    //_obscurePassword = true;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
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

            //PHONE NUMBER AREA
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone number',
                filled: true,
                isDense: true,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
              obscureText: false,
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              //autocorrect: false,
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Registered"),
                      backgroundColor: Colors.green,
                    ));
                  }

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false,
                  );
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
