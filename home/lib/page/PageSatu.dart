// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'dart:convert';
import './mainPage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:accounts/utils/network_service.dart';

// ignore: must_be_immutable
class PageSatu extends StatelessWidget {
  final _myKey = GlobalKey<FormState>();
  String formValue = "";
  String name = "";
  final TextEditingController myController = TextEditingController();

  PageSatu({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  Future post_feedback(String feedback, String name) async {
    final response = await http.post(
        Uri.parse("https://e-nadi.herokuapp.com/home/post_feedback"),
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods":
              "POST, GET, OPTIONS, PUT, DELETE, HEAD",
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'the_feedback': feedback,
        }));

    //print(response.body);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        // ignore: prefer_const_constructors
        title: Text("E - Nadi"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _myKey,
            child: Column(children: [
              TextFormField(
                showCursor: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Enter your feedback",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please fill the feedback';
                  }
                  formValue = value;
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_myKey.currentState!.validate()) {
                    // ignore: unnecessary_string_interpolations
                    post_feedback(formValue, "${request.username}");
                  }
                },
                child: const Text('Submit'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
