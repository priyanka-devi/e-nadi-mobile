import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PageSatu extends StatelessWidget{
  final _myKey = GlobalKey<FormState>();
  String formValue = "";
  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("E - Nadi"),
      ),

      body: Center(
        child : Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key : _myKey,
            child:Column(
                children:[
                  TextFormField(
                    showCursor: true,
                    decoration: InputDecoration(
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

                    validator: (value){
                      if (value!.isEmpty){
                        return 'please fill the feedback';
                      }
                      formValue= value;
                      return null;
                    },

                  ),

                  ElevatedButton(
                    onPressed: () async {
                      if (_myKey.currentState!.validate()){
                        print(formValue);

                        final response = await http.post(Uri.parse(
                            'https://e-nadi.herokuapp.com/home/getnews'),
                            headers: <String, String>{
                              'Content-Type' : 'application/json;charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              "name" : "Arsan",
                              "the_feedback" : formValue,

                            })
                        );
                      }

                    },

                    child: const Text('Submit'),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}