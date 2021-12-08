import 'dart:convert';

import 'package:accounts/components/textfield_input.dart';
import 'package:accounts/components/textfield_inputpassword.dart';
import 'package:accounts/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:accounts/components/already_have_an_account_check.dart';
import 'package:accounts/screens/signup_screen.dart';
import 'package:accounts/constants.dart';
import 'package:accounts/components/button.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  final VoidCallback? onSignIn;

  const LoginScreen({Key? key, this.onSignIn}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  // String textFieldsValue1 = "";
  // String textFieldsValue2 = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/main_top.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset("assets/images/login_bottom.png"),
              width: size.width * 0.4,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                    GestureDetector(
                      child: Image.asset(
                        "assets/images/nav-logo2.png",
                        scale: 0.6,
                        // height: size.height * 2,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const WelcomeScreen();
                            }));
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),

                    RoundedInput(
                        hint: "Username",
                        controller: _controller1
                    ),

                    RoundedPasswordField(
                        hint: "Password",
                        controller: _controller2
                    ),

                    Button(
                        text: "Login",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await http.post(
                                Uri.parse(
                                    "http://10.0.2.2:8000/login_flutter/"),
                                headers: <String, String>{
                                  'Content-Type':
                                  'application/json; charset=UTF-8',
                                },
                                body: jsonEncode(<String, String>{
                                  'username': _controller1.text,
                                  'password': _controller2.text,
                                }));
                            if (response.statusCode == 201) {
                              // If the server did return a 201 CREATED response,
                              // then parse the JSON.
                              _controller1.clear();
                              _controller2.clear();
                              // Map<String, dynamic> data = json.decode(response.body);
                              // print(data.values.first);
                              print(response.body);

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Login Success'),
                                  content: const Text('Welcome to E-Nadi'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              // If the server did not return a 201 CREATED response,
                              // then throw an exception.
                              print("Username/Password salah");
                            }
                          } else {
                            print("Ga Valid");
                          }
                        }),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }));
                      },
                      login: true,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
