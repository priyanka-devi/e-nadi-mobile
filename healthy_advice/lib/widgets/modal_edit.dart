import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/healthy_advice_home.dart';
import 'package:healthy_advice/widgets/card_comment.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ModalEdit extends StatefulWidget {
  const ModalEdit({Key? key, required this.isUser, required this.comment}) : super(key: key);
  final bool isUser;
  final CardComment comment;

  @override
  _ModalEditState createState() => _ModalEditState();
}

class _ModalEditState extends State<ModalEdit> {
  final _formKey = GlobalKey<FormState>();
  String textFieldsValue = "";
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return AlertDialog(

        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Edit Your Comment"),
            // _getCloseButton(context),
          ],

        ),
        content:
            Form(
                key: _formKey,
              child:
              TextFormField(
                  decoration: InputDecoration(
                      hintText: "Edit your comment here"
                  ),
                      validator: (value){
                        if (value!.isEmpty){
                          return 'Required Field';
                        }
                        else{
                          textFieldsValue = value;
                          return null;
                        }},

              ),
            ),
        actions: [
          TextButton(
            child: Text("Post",
            style: TextStyle(
                fontSize: 16
            ),),
            onPressed: () async{
              if (_formKey.currentState!.validate()){
                final response = await http.post(Uri.parse(
                  "http://10.0.2.2:8000/healthy_advice/editCommentAPI/" + widget.comment.commentPk.toString(),
                ),
                    headers: {
                      "Content-Type" : 'application/json; charset=UTF-8'
                    },
                    body:
                    convert.jsonEncode(<String, String>{
                      'commentator_name': "priyanka_devi",
                      'comment_field': textFieldsValue,
                    }));
                if (response.statusCode == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Comment success"),
                      ));
                  Navigator.pushReplacementNamed(
                      context, HealthyAdviceHome.routeName);
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
          ),
          TextButton(
            child: Text("Cancel",
            style: TextStyle(
              color: Colors.red,
                fontSize: 16
            ),),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ]
    );

}

}
