import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/healthy_advice_home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class CommentTextField extends StatefulWidget {
  const CommentTextField({Key? key}) : super(key: key);

  @override
  _CommentTextFieldState createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  final _formKey = GlobalKey<FormState>();
  String textFieldsValue ="";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text("LEAVE A CONSTRUCTIVE COMMENT BELOW", style:
            TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20,
            ),textAlign: TextAlign.center),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.all(20.0),
              child:
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: "Leave a comment",
                          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          )
                      ),
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Required Field';
                        }
                        textFieldsValue = value;
                        return null;
                      },
                    ),
                    SizedBox(height: 12,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                        side: BorderSide(width: 2, color: Colors.indigo),
                        padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()){
                          final response = await http.post(Uri.parse(
                              "http://10.0.2.2:8000/healthy_advice/addAPI",
                              ),
                            headers: {
                          "Content-Type" : 'application/json; charset=UTF-8'
                          },
                            body:
                            convert.jsonEncode(<String, String>{
                              'commentator_name': "priyanka_devi",
                              'comment_field': textFieldsValue.toString(),
                              }));
                          if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Comment success"),
                          ));
                          // Route route = MaterialPageRoute(
                          // builder: (context) => HealthyAdviceHome(title: 'e-nadi Healthy Advice');
                          Navigator.pushReplacementNamed(
                                context, HealthyAdviceHome.routeName);
                          // },
                          // );

                          }
                          else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                          content:
                          Text("Please try again."),
                          ));
                          }
                          // print(textFieldsValue);
                        };

                      },
                      child: const Text('POST'),
                    ),
                    SizedBox(height: 20,),
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
        )
    );
  }
}
