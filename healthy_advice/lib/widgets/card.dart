/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that can be tapped. When
// tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
// entire card.

import 'package:flutter/material.dart';


class CardSehat extends StatefulWidget {
  const CardSehat({Key? key, required this.title, required this.imageLink, required this.imageArticle, required this.deskripsi, required this.createdAt}) : super(key: key);
  final String title;
  final String imageLink;
  final String deskripsi;
  final String imageArticle;
  final String createdAt;

  @override
  _CardSehatState createState() => _CardSehatState();
}

class _CardSehatState extends State<CardSehat> {
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
                      SizedBox(height: 20,),
                      Text(widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      textAlign: TextAlign.center,),
                      SizedBox(height: 20,),
                      Image.network(widget.imageLink, height: 120,),
                      SizedBox(height: 20,),
                      Text(widget.deskripsi.substring(0,100), style: TextStyle(
                        fontSize: 14,
                      ),textAlign: TextAlign.left,),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Created at : " + widget.createdAt, style: TextStyle(
                            fontSize: 12,
                          ),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
                          primary: Colors.teal,
                          onPrimary: Colors.white,
                          side: BorderSide(width: 2, color: Colors.teal),
                          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),),
                        onPressed: () {},
                        child: const Text('View Details'),
                      ),
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
