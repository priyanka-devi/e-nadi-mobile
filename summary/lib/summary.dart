import 'package:flutter/material.dart';
import 'package:summary/screens/summary_screen.dart';

void main() {
  runApp(const SummaryApp());
}

class SummaryApp extends StatelessWidget {
  const SummaryApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Nadi Summary',
      theme: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: ActivitySummaryApp(
        title: '',
      ),
    );
  }
}
