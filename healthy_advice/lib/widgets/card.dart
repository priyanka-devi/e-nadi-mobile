/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that can be tapped. When
// tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
// entire card.

import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/article_detail.dart';
// ignore: unused_import
import 'package:healthy_advice/screens/healthy_advice_home.dart';
// ignore: duplicate_import
import 'package:healthy_advice/screens/article_detail.dart';

class CardSehat extends StatefulWidget {
  const CardSehat(
      {Key? key,
      required this.title,
      required this.imageLink,
      required this.imageArticle,
      required this.deskripsi,
      required this.createdAt})
      : super(key: key);
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
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      widget.imageLink,
                      height: 120,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.deskripsi.substring(0, 100),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Created at : " + widget.createdAt,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        side: const BorderSide(width: 2, color: Colors.teal),
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        // ignore: unnecessary_new
                        shape: new RoundedRectangleBorder(
                            // ignore: unnecessary_new
                            borderRadius: new BorderRadius.circular(8.0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ArticleDetail(
                                title: widget.title,
                                imageArticle: widget.imageArticle,
                                deskripsi: widget.deskripsi,
                                createdAt: widget.createdAt),
                          ),
                        );
                      },
                      child: const Text('View Details'),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
