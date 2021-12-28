import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy_advice/widgets/card_comment.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ModalDelete extends StatefulWidget {
  const ModalDelete({Key? key, required this.comment, required this.isUser}) : super(key: key);
  final bool isUser;
  final CardComment comment;

  @override
  _ModalDeleteState createState() => _ModalDeleteState();
}

class _ModalDeleteState extends State<ModalDelete> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(

        title:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/healthy_advice/deleteModal_HA.png", width: 132,),
            Text("Are you sure?", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),
            SizedBox(height: 12,),
            Text("Do you really want to delete your comment? This process cannot be undone.",
            style: TextStyle(
              fontSize: 16, color: Colors.black45
            ),
            textAlign: TextAlign.center,),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
                      primary: Colors.grey,
                      onPrimary: Colors.white,
                      side: BorderSide(width: 2, color: Colors.grey),
                      padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')
                ),
                SizedBox(width: 8,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      side: BorderSide(width: 2, color: Colors.red),
                      padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),),
                    onPressed: () async{
                      final response = await http.post(Uri.parse(
                        "http://10.0.2.2:8000/healthy_advice/delete/" + widget.comment.commentPk.toString(),
                      ),
                          headers: {
                            "Content-Type" : 'application/json; charset=UTF-8'
                          },
                          body:
                          convert.jsonEncode(<String, String>{
                            'pk': widget.comment.commentPk.toString(),
                          }));
                      Navigator.pop(context);
                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Delete success"),
                            ));
                      }
                      else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                          Text("Please try again."),
                        ));
                      }
                      // print(textFieldsValue);
                    },
                    child: const Text('Delete')
                ),
              ],
            ),

          ],

        ),


    );

  }

}
