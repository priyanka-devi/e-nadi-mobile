import 'package:accounts/screens/login_screen.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/healthy_advice_home.dart';
import 'package:provider/provider.dart';
import 'package:accounts/screens/welcome_screen.dart';
import 'package:accounts/constants.dart';
import 'package:sleep/screens/sleep_screens.dart';
import 'package:workout/screens/workout_screen.dart';
import 'package:recipe/main.dart';
import 'package:summary/screens/summary_screen.dart';
import 'package:home/page/mainPage.dart';

/// This is the main application widget.
void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
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
            primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
        home: const MainPage(),
        routes: {
          WorkoutPage.routeName: (context) =>
              const WorkoutPage(title: 'e-nadi Workout'),
          HealthyAdviceHome.routeName: (context) =>
              const HealthyAdviceHome(title: 'e-nadi Healthy Advice'),
          LoginScreen.routeName: (context) => const LoginScreen(),
          MainPage.routeName: (context) => const MainPage(),
          RecipePage.routeName: (context) =>
              const RecipePage(title: 'e-nadi Recipe'),
          ActivitySummaryApp.routeName: (context) =>
              const ActivitySummaryApp(title: 'e-nadi Summary'),
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          SleepPage.routeName: (context) =>
              const SleepPage(title: 'e-nadi Sleep Tracker'),
        },
      ),
    );
  }
}

// class HomeDummy extends StatefulWidget {
//   static const routeName = '/homedummy';
//   const HomeDummy({Key? key}) : super(key: key);
//
//   @override
//   _HomeDummyState createState() => _HomeDummyState();
// }
//
// class _HomeDummyState extends State<HomeDummy> {
//   @override
//   Widget build(BuildContext context) {
//     final request = context.watch<NetworkService>();
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Home Dummy"),
//         ),
//         drawer: request.username != ""
//             ? const DrawerScreen()
//             : const DrawerScreen(),
//         body: Container());
//   }
// }
