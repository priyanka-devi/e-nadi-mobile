// ignore_for_file: avoid_unnecessary_containers, unnecessary_new

import 'package:accounts/utils/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:accounts/utils/drawer_screen.dart';
import 'dart:convert';

class SleepPage extends StatefulWidget {
  static const routeName = '/sleep';
  const SleepPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  int _counter = 0;
  String _username = "user";
  DateTime _now = DateTime.now();
  String _condition = "You should get more sleep!";
  Color _color = Colors.red;
  final myController = TextEditingController();

  getSleep(request) async {
    const url = 'https://e-nadi.herokuapp.com/sleep/get_sleeps';
    final response = await request.get(url);
    if (response['s_username'] != "") {
      setState(() {
        _now = DateTime.parse(response['s_today']);
        _username = response['s_username'];
        _counter = response['s_counter'];
        _changeCondition();
      });
    }
    return "Not Null";
  }

  void _incrementCounter(request) async {
    if (int.tryParse(myController.text) != null) {
      int temp = int.tryParse(myController.text)!;

      final response = await request.postJson(
          "https://e-nadi.herokuapp.com/sleep/post_sleeps",
          jsonEncode(<String, int>{
            'add': temp,
          }));

      if (response['s_username'] != "") {
        setState(() {
          _now = DateTime.now();
          _username = response['s_username'];
          _counter = response['s_counter'];
          _changeCondition();
        });
      } else {
        setState(() {
          _now = DateTime.now();
          _counter += temp;
          _changeCondition();
        });
      }
    }
    myController.clear();
  }

  void _reset(request) async {
    const url = 'https://e-nadi.herokuapp.com/sleep/reset_sleeps';
    final response = await request.get(url);
    if (response['s_username'] != "") {
      setState(() {
        _now = DateTime.now();
        _username = response['s_username'];
        _counter = response['s_counter'];
        _changeCondition();
      });
    } else {
      setState(() {
        _now = DateTime.now();
        _counter = 0;
        _condition = "You Need More Sleep";
      });
    }
  }

  void _changeCondition() {
    setState(() {
      if (_counter < 5) {
        _condition = "You Need More Sleep";
        _color = Colors.red;
      } else if (_counter < 7) {
        _condition = "Almost There";
        _color = Colors.orange;
      } else if (_counter < 9) {
        _condition = "Well Done";
        _color = Colors.green;
      } else if (_counter < 15) {
        _condition = "You Must Be Really Tired";
        _color = Colors.orange;
      } else {
        _condition = "I Think This Is Too Much Sleep";
        _color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerScreen(),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: const Text(
                      "Tell Us About Your Sleep Today!",
                      style: TextStyle(
                        color: Colors.white,
                        height: 2,
                      ),
                    )),
                    Container(
                      color: const Color(0xFF212121),
                      child: const Image(
                          width: double.infinity,
                          image: NetworkImage(
                              "https://e-nadi.herokuapp.com/static/img/night.jpeg")),
                    ),
                  ],
                ),
                width: double.infinity,
                color: Colors.blue,
              ),
              FutureBuilder(
                  future: getSleep(request),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Text("Loading...");
                    } else {
                      return const Text(
                        "About Your Sleep",
                        style: TextStyle(fontSize: 25),
                      );
                    }
                  }),
              Card(
                shape: new RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(4.0)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.bedtime),
                      title: Text(
                        _now.day.toString() +
                            ' | ' +
                            _now.month.toString() +
                            ' | ' +
                            _now.year.toString(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        "Username: $_username",
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Sleep Time: $_counter Hours',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Sleep Quality: $_condition',
                              style: TextStyle(color: _color, fontSize: 16),
                            ),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                labelText: 'Tell us your sleep time!'),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            controller: myController,
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                //textColor: const Color(0xFF6200EE),
                                onPressed: () {
                                  // Perform some action
                                  _incrementCounter(request);
                                },
                                child: const Text('UPDATE'),
                              ),
                              TextButton(
                                //textColor: const Color(0xFF6200EE),
                                onPressed: () {
                                  // Perform some action
                                  _reset(request);
                                },
                                child: const Text('RESET'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Text(
                      "About Us",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    )),
                  ],
                ),
                height: 100,
                width: double.infinity,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
