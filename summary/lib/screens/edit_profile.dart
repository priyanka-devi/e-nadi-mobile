import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:summary/screens/summary_screen.dart';
import 'package:accounts/utils/drawer_screen.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:provider/provider.dart';
import 'package:summary/components/input.dart';

class EditProfileApp extends StatefulWidget {
  const EditProfileApp({Key? key, required this.title}) : super(key: key);
  final String title;

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
        title: Text(widget.title),
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(241, 230, 255, 0.7),
                      Color.fromRGBO(241, 230, 255, 0.7)
                    ]),
                image: DecorationImage(
                  image: AssetImage("assets/images/login_bottom.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text(
                      "HELLO !",
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Edit Your Profile",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "---------------------",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 5.0),
                            clipBehavior: Clip.antiAlias,
                            color: Colors.white,
                            elevation: 13.0,
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
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        const CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 45.0,
                                        ),
                                        const SizedBox(
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
                        const SizedBox(
                          height: 20.0,
                        ),
                        Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 13.0,
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
                                      const SizedBox(
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
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.indigo),
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

                                              if (response["status"] ==
                                                  "success") {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: const Text(
                                                          'Profile Successfully Updated!'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                            child: const Text(
                                                                'Ok'),
                                                            onPressed: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          const ActivitySummaryApp(
                                                                              title: 'e-nadi Summary')));
                                                            }),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            }
                                          },
                                          child: const Text('SAVE CHANGES'),
                                        ),
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'TO ACTIVITY SUMMARY',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ActivitySummaryApp(
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
                    const SizedBox(
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
