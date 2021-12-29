/// Flutter code sample for Card
// This sample shows creation of a [Card] widget that can be tapped. When
// tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
// entire card.

import 'package:flutter/material.dart';
import 'package:sleep/models/models_sleep.dart';
import 'package:sleep/sleep.dart';

// import 'package:healthy_advice/screens/article_detail.dart';
// import 'package:healthy_advice/screens/article_detail.dart';

class SleepCard extends StatefulWidget {
  const SleepCard(
      {Key? key,
      required this.user,
      required this.today,
      required this.time})
      : super(key: key);

  final int user;
  final String today;
  final int time;

  @override
  _SleepCardState createState() => _SleepCardState();
}

class _SleepCardState extends State<SleepCard> {
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
                  padding: EdgeInsets.all(20.0),
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.user.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      widget.today,
                      height: 120,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.time.toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Created at : " + widget.createdAt,
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     textStyle: const TextStyle(fontSize: 20),
                    //     primary: Colors.teal,
                    //     onPrimary: Colors.white,
                    //     side: BorderSide(width: 2, color: Colors.teal),
                    //     padding: EdgeInsets.only(
                    //         left: 12, right: 12, top: 8, bottom: 8),
                    //     shape: new RoundedRectangleBorder(
                    //         borderRadius: new BorderRadius.circular(8.0)),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) => Sleep(
                    //             title: widget.title,
                    //             imageArticle: widget.imageArticle,
                    //             deskripsi: widget.deskripsi,
                    //             createdAt: widget.createdAt),
                    //       ),
                    //     );
                    //   },
                    //   child: const Text('View Details'),
                    // ),
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
