import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:healthy_advice/widgets/card.dart';
import 'package:healthy_advice/widgets/card_comment.dart';
import 'package:healthy_advice/widgets/carousel.dart';
import 'package:healthy_advice/widgets/comment_textField.dart';
import 'package:healthy_advice/Model/isi_comment.dart';
import 'package:healthy_advice/Model/isi_article.dart';
import 'package:healthy_advice/screens/drawer_screen.dart';

class HealthyAdviceHome extends StatefulWidget {
  const HealthyAdviceHome({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HealthyAdviceHomeState createState() => _HealthyAdviceHomeState();
}

class _HealthyAdviceHomeState extends State<HealthyAdviceHome> {

  List<IsiComment> extractedData = [];
  List<IsiArticle> extractedArticle = [];
  articleData() async {

    const url = 'https://e-nadi.herokuapp.com/healthy_advice/get_all_article';
    try {
      extractedArticle = [];
      final response = await http.get(Uri.parse(url));
      // print(response.body);
      final dataJson = jsonDecode(response.body);
      for (var dataArticle in dataJson){
        FieldsArticle fields = FieldsArticle(
            title: dataArticle["fields"]["title"],
            imageLink: dataArticle["fields"]["image_link"],
            imageArticle: dataArticle["fields"]["image_article"],
            deskripsi: dataArticle["fields"]["deskripsi"],
            createdAt: dataArticle["fields"]["created_at"]);
        IsiArticle article =
        IsiArticle(model: dataArticle["model"], pk: dataArticle["pk"], fields: fields);
        extractedArticle.add(article);
      }
      return extractedArticle;
    } catch (error) {
      print(error);
    }
  }


  fetchData() async {

    const url = 'https://e-nadi.herokuapp.com/healthy_advice/get_all_comment';
    try {
      extractedData = [];
      final response = await http.get(Uri.parse(url));
      // print(response.body);
      final dataJson = jsonDecode(response.body);
      for (var anu in dataJson){
        Fields fields = Fields(
            commentatorName: anu["fields"]["commentator_name"],
            commentField: anu["fields"]["comment_field"]);
        IsiComment comment =
            IsiComment(model: anu["model"], pk: anu["pk"], fields: fields);
        extractedData.add(comment);
      }
      print(extractedData.length);
      return extractedData;
    } catch (error) {
      print(error);
    }
  }

  void didChangeDependencies() {
      fetchData();
      articleData();
      super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselHealthyAdv(),
            SizedBox(height: 24),
            FutureBuilder(
                future: articleData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                          child: Text(
                            "Loading...",
                          )),
                    );
                  } else {
                    return Column(
                        children:
                        extractedArticle.map((anu) {
                          return CardSehat(
                            createdAt: anu.fields.createdAt,
                            imageArticle: anu.fields.imageArticle,
                            deskripsi: anu.fields.deskripsi,
                            imageLink: anu.fields.imageLink,
                            title: anu.fields.title,
                          );
                        }).toList()
                    );

                  }
                }),
            // CardSehat(),
            // CardSehat(),
            // CardSehat(),
            SizedBox(
              height: 20,
            ),
            CommentTextField(),
            FutureBuilder(
                future: fetchData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                          child: Text(
                            "Loading...",
                          )),
                    );
                  } else {
                    return Column(
                        children:
                        extractedData.map((anu) {
                          return CardComment(
                            commentatorName : anu.fields.commentatorName,
                            commentField : anu.fields.commentField,
                          );
                        }).toList()
                    );

                  }
                }),
            // CardComment(),
            // CardComment(),
            // CardComment(),
            // CardComment(),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      ),

    );

  }
}
