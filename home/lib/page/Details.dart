import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';



class Details extends StatefulWidget {
  var title;
  var thumbnail;
  var intro;
  var image;
  var news;
  Details({
    required this.title,
    required this.thumbnail,
    required this.intro,
    required this.image,
    required this.news,
  });
  @override
  _Details createState() => _Details(
    title: title,
    thumbnail: thumbnail,
    intro: intro,
    image: image,
    news: news,
  );
}
class _Details extends State<Details>{
  var title;
  var thumbnail;
  var intro;
  var image;
  var news;
  _Details({
    required this.title,
    required this.thumbnail,
    required this.intro,
    required this.image,
    required this.news,
  });

  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(this.title),
      ),


      body: ListView(

        children: [
          Container(

            height: 400,
            color: Colors.tealAccent,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(this.image),
            ),
          ),
          Container(

            padding: new EdgeInsets.all(30.0),
            child: Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 6.0, // gap between lines
              direction: Axis.horizontal, // main axis (rows or columns)

              children: <Widget>[

                Text(
                  (this.intro+this.news),

                ),

              ],
            ),
          ),


        ],

      ),


    );
  }
}