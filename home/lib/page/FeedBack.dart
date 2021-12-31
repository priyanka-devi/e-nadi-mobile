// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class Feedpage extends StatefulWidget {
  const Feedpage({Key? key}) : super(key: key);

  @override
  _FeedBack createState() => _FeedBack();
}

class _FeedBack extends State<Feedpage> {
  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        extractedData.addAll(value);
      });
    });
    super.initState();
  }

  List<dynamic> extractedData = [];

  Future<List<dynamic>> fetchData() async {
    var url = Uri.parse('https://e-nadi.herokuapp.com/home/getnews');

    final response = await http.get(url);
    var data = jsonDecode(response.body);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("Feedback"),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var listFeedback = snapshot.data;

            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    (listFeedback as dynamic)[index]["fields"]['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    (listFeedback as dynamic)[index]["fields"]['the_feedback'],
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                );
              },
              itemCount: (listFeedback as dynamic).length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
