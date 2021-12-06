import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:healthy_advice/widgets/card.dart';
import 'package:healthy_advice/widgets/card_comment.dart';
import 'package:healthy_advice/widgets/carousel.dart';
import 'package:healthy_advice/widgets/comment_textField.dart';


class HealthyAdviceHome extends StatefulWidget {
  const HealthyAdviceHome({Key? key}) : super(key: key);

  @override
  _HealthyAdviceHomeState createState() => _HealthyAdviceHomeState();
}

class _HealthyAdviceHomeState extends State<HealthyAdviceHome> {
  @override
  List<dynamic> extractedData = [];
  fetchData() async {
    const url = 'http://10.0.2.2:8000/healthy_advice/get_all_comment';
    try {
      final response = await http.get(Uri.parse(url));
      // print(response.body);
      extractedData = jsonDecode(response.body);
      print(extractedData);
      return extractedData;
    } catch (error) {
      print(error);
    }
  }
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      fetchData();
    });
  }



  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[


        CarouselHealthyAdv(),
        SizedBox(height: 24),
        CardSehat(),
        CardSehat(),
        CardSehat(),
        SizedBox(height: 20,),
        CommentTextField(),
        CardComment(),
        CardComment(),
        CardComment(),
        CardComment(),
        SizedBox(height: 20,),
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
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text("Comment"),
                          Text(
                              snapshot.data[index]["fields"]["commentator_name"].toString()
                          ),
                          Text(
                              snapshot.data[index]["fields"]["comment_field"].toString()
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1,
                      );
                    },
                  );
                }
              }),


              // width: ,

        ]
    );
  }
}
