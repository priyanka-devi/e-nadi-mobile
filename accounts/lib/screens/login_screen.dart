import 'package:accounts/components/textfield_input.dart';
import 'package:accounts/components/textfield_inputpassword.dart';
import 'package:accounts/screens/welcome_screen.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:flutter/material.dart';
import 'package:accounts/components/already_have_an_account_check.dart';
import 'package:accounts/screens/signup_screen.dart';
import 'package:accounts/constants.dart';
import 'package:accounts/components/button.dart';
import 'package:recipe/main.dart';
import 'package:provider/provider.dart';

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
                    RoundedInput(hint: "Username", controller: _controller1),
                    RoundedPasswordField(
                        hint: "Password", controller: _controller2),
                    Button(
                        text: "Login",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await request.login(
                                "https://e-nadi.herokuapp.com/authentication/login_flutter/",
                                {
                                  'username': _controller1.text,
                                  'password': _controller2.text,
                                });

                            if (response['status']) {
                              // If the server did return a 201 CREATED response,
                              // then parse the JSON.

                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Login Success'),
                                  content: Text('Welcome to E-Nadi, ' +
                                      response['username']),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: kPrimaryLightColor,
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pushReplacementNamed(
                                              context, RecipePage.routeName),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                              _controller1.clear();
                              _controller2.clear();
                            } else {
                              // If the server did not return a 201 CREATED response,
                              // then throw an exception.
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Login Failed'),
                                  content:
                                      const Text('Wrong Username or Password'),
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
