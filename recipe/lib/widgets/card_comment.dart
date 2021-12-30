// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:recipe/widgets/action_delete.dart';

class CardComment extends StatefulWidget {
  const CardComment({
    Key? key,
    required this.username,
    required this.content,
    required this.post_date,
    required this.commentPk,
  }) : super(key: key);
  final String username;
  final String content;
  final String post_date;
  final int commentPk;
  @override
  _CardCommentState createState() => _CardCommentState();
}

class _CardCommentState extends State<CardComment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          child: SizedBox(
            width: 600,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.username,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.post_date,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.content,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              side: BorderSide(width: 4, color: Colors.red),
                              padding: EdgeInsets.only(
                                  left: 4, right: 4, top: 2, bottom: 2),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(4.0)),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ModalDelete(
                                      isUser: true,
                                      comment: widget,
                                    );
                                  });
                            },
                            child: const Text('Delete')),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
