import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalEdit extends StatefulWidget {
  const ModalEdit({Key? key, required this.isUser}) : super(key: key);
  final bool isUser;

  @override
  _ModalEditState createState() => _ModalEditState();
}

class _ModalEditState extends State<ModalEdit> {
  @override
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
        content: TextField(
            decoration: InputDecoration(
                hintText: "Edit your comment here"
            )
        ),
        actions: [
          TextButton(
            child: Text("Post",
            style: TextStyle(
                fontSize: 16
            ),),
            onPressed: () {},
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
