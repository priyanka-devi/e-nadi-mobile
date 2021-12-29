import 'package:accounts/components/button.dart';
import 'package:flutter/material.dart';
import 'package:accounts/constants.dart';

import 'package:accounts/screens/login_screen.dart';
import 'package:accounts/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
              width: size.width * 0.3,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png"),
              width: size.width * 0.2,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/nav-logo2.png",
                    scale: 0.6,
                    // height: size.height * 2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Welcome to E-Nadi!",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(height: size.height * 0.05),
                  Button(
                      text: "LOGIN",
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                      }),
                  Button(
                      text: "SIGN UP",
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const SignUpScreen();
                            }));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
