import 'dart:convert';
//import 'package:my_dummy/CLass/feedback.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import './Details.dart';



class ListNews extends StatefulWidget {

  @override
  _ListNews createState() => _ListNews();
}
class _ListNews extends State<ListNews>{


  @override
  void initState(){
    fetchData().then((value){
      setState(() {
        extractedData.addAll(value);
      });
    });
    super.initState();


  }
  List<dynamic> extractedData = [];

  Future<List<dynamic>> fetchData() async {
    var url = Uri.parse( 'https://e-nadi.herokuapp.com/home/getfeedback');

    final response = await http.get(url);
    var data = jsonDecode(response.body);

    return data;
  }



  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("News"),
      ),


      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot){

          if (snapshot.hasData){
            //print(snapshot.data);
            var listNews = snapshot.data;


            return ListView.builder(
              itemBuilder: (context, index){
                return Container(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        Container(
                          height: 250,
                          color: Colors.tealAccent,
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage((listNews as dynamic )[index]['fields']['image']),
                          ),
                        ),


                        ListTile(

                          title: Text((listNews as dynamic )[index]['fields']['title']),
                          subtitle: Text((listNews as dynamic )[index]['fields']['thumbnail']),
                        ),
                        Row(

                          children: <Widget>[
                            TextButton(
                              child:  Text('MORE'),
                              onPressed: (){

                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Details(
                                    title: (listNews as dynamic )[index]['fields']['title'],
                                    image: (listNews as dynamic )[index]['fields']['image'],
                                    intro: (listNews as dynamic )[index]['fields']['intro'],
                                    news: (listNews as dynamic )[index]['fields']['news'],
                                    thumbnail: (listNews as dynamic )[index]['fields']['thumbnail'],
                                  ),),
                                );
                              },
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: (listNews as dynamic).length,
            );
          }else{
            return Center(
                child: CircularProgressIndicator()
            );

          }
        },
      ),

    );
  }
}