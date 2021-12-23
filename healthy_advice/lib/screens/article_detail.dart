import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ArticleDetail extends StatefulWidget {
  const ArticleDetail({Key? key, required this.title, required this.imageArticle, required this.deskripsi, required this.createdAt}) : super(key: key);
  final String title;
  final String deskripsi;
  final String imageArticle;
  final String createdAt;

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Healthy Advice Article"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Image.network(widget.imageArticle),
              SizedBox(height: 20,),
              Text(widget.title, style: TextStyle (
                fontSize: 24, fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
              SizedBox(height: 20,),
              Text(widget.createdAt, style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20
              ),
                textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text(widget.deskripsi,
              style: TextStyle(
                fontWeight: FontWeight.normal, fontSize: 16,
              ),
              textAlign: TextAlign.justify,)
            ],
          ),
        )
      ),
    );
  }
}
