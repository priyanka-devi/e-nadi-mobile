import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:summary/screens/summary_screen.dart';
import 'package:accounts/utils/drawer_screen.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:summary/components/input.dart';

class EditProfileApp extends StatefulWidget {
  const EditProfileApp({Key? key}) : super(key: key);

  @override
  _EditAppState createState() => _EditAppState();
}

class _EditAppState extends State<EditProfileApp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController unameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController profController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobController = TextEditingController();
  final TextEditingController addrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      appBar: AppBar(
        title: Text("e-Nadi", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.black]),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "HELLO !",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Edit Your Profile",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "---------------------",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.yellow[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Color.fromRGBO(242, 248, 243, 0.5),
                            elevation: 5.0,
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 22.0),
                                child: Row(children: <Widget>[
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 45.0,
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        InputField(
                                            hint: "Username",
                                            controller: unameController),
                                        InputField(
                                            hint: "Gender (Male/Female)",
                                            controller: genderController),
                                        InputField(
                                            hint: "Age",
                                            controller: ageController),
                                        InputField(
                                            hint: "Profession",
                                            controller: profController),
                                      ]))
                                ]))),
                        SizedBox(
                          height: 20.0,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Color.fromRGBO(242, 248, 243, 0.5),
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 22.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      InputField(
                                          hint: "First Name",
                                          controller: fnameController),
                                      InputField(
                                          hint: "Last Name",
                                          controller: lnameController),
                                      InputField(
                                          hint: "Email",
                                          controller: emailController),
                                      InputField(
                                          hint: "Mobile",
                                          controller: mobController),
                                      InputField(
                                          hint: "Address",
                                          controller: addrController),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey[800]),
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final response =
                                                  await request.postJson(
                                                      "https://e-nadi.herokuapp.com/summary/post_profile/",
                                                      convert.jsonEncode(<
                                                          String, String>{
                                                        'username':
                                                            unameController
                                                                .text,
                                                        'gender':
                                                            genderController
                                                                .text,
                                                        'age':
                                                            ageController.text,
                                                        'profession':
                                                            profController.text,
                                                        'first_name':
                                                            fnameController
                                                                .text,
                                                        'last_name':
                                                            lnameController
                                                                .text,
                                                        'email': emailController
                                                            .text,
                                                        'mobile':
                                                            mobController.text,
                                                        'address':
                                                            addrController.text,
                                                      }));

                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Profile Successfully Updated!'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                          child: Text('Ok'),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ActivitySummaryApp(
                                                                            title:
                                                                                'e-nadi Summary')));
                                                          }),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: const Text('SAVE CHANGES'),
                                        ),
                                      ),
                                      TextButton(
                                        child: Text(
                                          'TO ACTIVITY SUMMARY',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ActivitySummaryApp(
                                                          title:
                                                              'e-nadi Summary')));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
