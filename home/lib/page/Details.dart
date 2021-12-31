// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, file_names

import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:core';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  var title;
  var thumbnail;
  var intro;
  var image;
  var news;
  Details({
    Key? key,
    required this.title,
    required this.thumbnail,
    required this.intro,
    required this.image,
    required this.news,
  }) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _Details createState() => _Details(
        title: title,
        thumbnail: thumbnail,
        intro: intro,
        image: image,
        news: news,
      );
}

class _Details extends State<Details> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        // ignore: unnecessary_this
        title: Text(this.title),
      ),
      body: ListView(
        children: [
          Container(
            height: 400,
            color: Colors.tealAccent,
            child: Image(
              fit: BoxFit.fill,
              // ignore: unnecessary_this
              image: NetworkImage(this.image),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 6.0, // gap between lines
              direction: Axis.horizontal, // main axis (rows or columns)

              children: <Widget>[
                Text(
                  // ignore: unnecessary_this
                  (this.intro + this.news),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
