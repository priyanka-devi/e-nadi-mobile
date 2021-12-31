import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:accounts/components/already_have_an_account_check.dart';
import 'package:accounts/components/button.dart';
import 'package:accounts/components/textfield_input.dart';
import 'package:accounts/components/textfield_inputpassword.dart';
import 'package:accounts/constants.dart';
import 'package:accounts/screens/login_screen.dart';
import 'package:accounts/screens/welcome_screen.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
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
              child: Image.asset("assets/images/signup_top.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png"),
              width: size.width * 0.23,
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
                      "SignUp",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    RoundedInput(hint: "First Name", controller: _controller1),
                    RoundedInput(hint: "Last Name", controller: _controller2),
                    RoundedInput(hint: "Username", controller: _controller3),
                    RoundedInput(hint: "Email", controller: _controller4),
                    RoundedPasswordField(
                        hint: "Password", controller: _controller5),
                    RoundedPasswordField(
                        hint: "Re-enter Password", controller: _controller6),
                    Button(
                        text: "SIGN UP",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await request.postJson(
                                "https://e-nadi.herokuapp.com/authentication/register_flutter/",
                                convert.jsonEncode(<String, String>{
                                  'first_name': _controller1.text,
                                  'last_name': _controller2.text,
                                  'username': _controller3.text,
                                  'email': _controller4.text,
                                  'password1': _controller5.text,
                                  'password2': _controller6.text,
                                }));

                            if (response['status'] == 'success') {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Register Success'),
                                  content: const Text(
                                      'Account has been successfully registered '),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: kPrimaryLightColor,
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                  Navigator.pushReplacementNamed(context, LoginScreen.routeName),
                                          // Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                              _controller1.clear();
                              _controller2.clear();
                              _controller3.clear();
                              _controller4.clear();
                              _controller5.clear();
                              _controller6.clear();
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Register Failed'),
                                  content: const Text(
                                      'An error occurred, please try again'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: kPrimaryLightColor,
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        }),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                      },
                      login: false,
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
