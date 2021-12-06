import 'package:flutter/material.dart';

class CardComment extends StatefulWidget {
  const CardComment({Key? key}) : super(key: key);

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
          onTap: () {
            print('Card tapped.');
          },
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
                            Text('Budi Tarmiji',
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
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore", style: TextStyle(
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
