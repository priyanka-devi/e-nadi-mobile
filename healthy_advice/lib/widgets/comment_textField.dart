// ignore_for_file: file_names, unnecessary_new

import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/healthy_advice_home.dart';
import 'dart:convert' as convert;
import 'package:provider/provider.dart';
import 'package:accounts/utils/network_service.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({Key? key}) : super(key: key);

  @override
  _CommentTextFieldState createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  final _formKey = GlobalKey<FormState>();
  String textFieldsValue = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    // ignore: avoid_print
    print(request.username);
    return Center(
        child: Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        const Text("LEAVE A CONSTRUCTIVE COMMENT BELOW",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: "Leave a comment",
                      contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required Field';
                    }
                    textFieldsValue = value;
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    primary: Colors.indigo,
                    onPrimary: Colors.white,
                    side: const BorderSide(width: 2, color: Colors.indigo),
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 8),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // final response = await http.post(Uri.parse(
                      //     //****
                      //     "http://10.0.2.2:8000/healthy_advice/addAPI",
                      //     ),
                      final response = await request.postJson(
                          // "http://10.0.2.2:8000/healthy_advice/addAPI",
                        "https://e-nadi.herokuapp.com/healthy_advice/addAPI",
                          convert.jsonEncode(<String, String>{
                            'commentator_name': request.username,
                            'comment_field': textFieldsValue.toString(),
                          }));
                      if (response["status"] == "success") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Comment success"),
                        ));
                        // Route route = MaterialPageRoute(
                        // builder: (context) => HealthyAdviceHome(title: 'e-nadi Healthy Advice');
                        Navigator.pushReplacementNamed(
                            context, HealthyAdviceHome.routeName);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Please try again."),
                        ));
                      }
                      // ignore: empty_statements
                    }
                    // ignore: empty_statements
                    ;
                  },
                  child: const Text('POST'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),

        // SizedBox(height: 12,),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
        //     primary: Colors.indigo,
        //     onPrimary: Colors.white,
        //     side: BorderSide(width: 2, color: Colors.indigo),
        //     padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        //     shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),),
        //   onPressed: () {},
        //   child: const Text('POST'),
        // ),
        // SizedBox(height: 20,),
      ],
    ));
  }
}
