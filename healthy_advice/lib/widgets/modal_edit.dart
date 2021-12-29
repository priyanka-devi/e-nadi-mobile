import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/healthy_advice_home.dart';
import 'package:healthy_advice/widgets/card_comment.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:accounts/utils/network_service.dart';

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
    final request = context.watch<NetworkService>();
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
                onChanged: (String? value) {
                  textFieldsValue = value!;},
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
                  // print(widget.comment.commentPk);
                  // if (_formKey.currentState!.validate()){
                  final response = await request.postJson(
                  "http://10.0.2.2:8000/healthy_advice/editCommentAPI/" + widget.comment.commentPk.toString(),
                  convert.jsonEncode(<String, String>{
                  'commentator_name': request.username,
                  'comment_field': textFieldsValue,
                  }));
                  if (response["status"] == "success") {
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
                  // };
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
