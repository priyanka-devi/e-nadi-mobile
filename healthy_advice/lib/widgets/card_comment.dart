import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardComment extends StatefulWidget {
  const CardComment({Key? key, required this.commentatorName, required this.commentField}) : super(key: key);
  final String commentatorName;
  final String commentField;
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
            width: 300,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child:
                  Column(
                      children: [
                        SizedBox(height: 8,),

                        Row(
                          children: [
                            Text(widget.commentatorName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Text("User", style: TextStyle(
                              fontSize: 12,
                            ),),

                          ],
                        ),

                        SizedBox(height: 8,),
                        Text(widget.commentField, style: TextStyle(
                          fontSize: 12,
                        ),),
                      ]
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
