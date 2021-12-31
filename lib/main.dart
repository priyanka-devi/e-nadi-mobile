import 'package:accounts/utils/network_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accounts/screens/welcome_screen.dart';
import 'package:accounts/constants.dart';
import 'package:summary/screens/summary_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white),
          home: const WelcomeScreen(),
          routes: {
            ActivitySummaryApp.routeName: (context) =>
                ActivitySummaryApp(title: 'e-nadi Summary')
          }),
    );
  }
}
