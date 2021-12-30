import 'package:accounts/utils/network_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accounts/screens/welcome_screen.dart';
import 'package:accounts/constants.dart';

import 'package:home/page/mainPage.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        NetworkService request = NetworkService();
        return request;
      },
      child: MaterialApp(
        title: "E-Nadi Login",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
        home: const WelcomeScreen(),
      ),
    );
  }
}
