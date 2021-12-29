import 'package:flutter/material.dart';
import 'package:healthy_advice/widgets/modal_delete.dart';
import 'package:healthy_advice/widgets/modal_edit.dart';
import 'package:provider/provider.dart';
import 'package:accounts/utils/network_service.dart';

class CardComment extends StatefulWidget {
  const CardComment(
      {Key? key,
      required this.commentatorName,
      required this.commentField,
      required this.commentPk})
      : super(key: key);
  final String commentatorName;
  final String commentField;
  final int commentPk;
  @override
  _CardCommentState createState() => _CardCommentState();
}

class _CardCommentState extends State<CardComment> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
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
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.commentatorName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Text(
                          "User",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              // width: double.infinity,
                              child: Text(
                                widget.commentField,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: widget.commentatorName == request.username
                          ? [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 12),
                                    primary: Colors.blueAccent,
                                    onPrimary: Colors.white,
                                    side: const BorderSide(
                                        width: 2, color: Colors.blueAccent),
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, top: 2, bottom: 2),
                                    // ignore: unnecessary_new
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ModalEdit(
                                            isUser: true,
                                            comment: widget,
                                          );
                                        });
                                  },
                                  child: const Text('Edit')),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 12),
                                    primary: Colors.red,
                                    onPrimary: Colors.white,
                                    side: const BorderSide(
                                        width: 2, color: Colors.red),
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, top: 2, bottom: 2),
                                    // ignore: unnecessary_new
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ModalDelete(
                                            isUser: true,
                                            comment: widget,
                                          );
                                        });
                                  },
                                  child: const Text('Delete')),
                            ]
                          : [],
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
