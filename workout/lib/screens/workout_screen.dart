import 'package:accounts/utils/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:accounts/utils/drawer_screen.dart';
import 'dart:convert';


class WorkoutPage extends StatefulWidget {
  static const routeName = '/workout';
  const WorkoutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  int _counter = 0;
  String _username = "user";
  DateTime now = DateTime.now();
  final myController = TextEditingController();

  getWorkout(request) async {
    const url = 'https://e-nadi.herokuapp.com/workout/get';
    final response = await request.get(url);
    if (response['w_username'] != ""){
      setState(() {
        now = DateTime.now();
        _username = response['w_username'];
        _counter = response['w_counter'];
      });

    }
    return "Not Null";
  }

  void _incrementCounter(request) async {
    if (int.tryParse(myController.text) != null){
      int temp = int.tryParse(myController.text)!;
      final response = await request.postJson(
          "https://e-nadi.herokuapp.com/workout/post",
          jsonEncode(<String, int>{
            'add': temp,
          }));

      if (response['w_username'] != ""){
        setState(() {
          now = DateTime.now();
          _username = response['w_username'];
          _counter = response['w_counter'];
        });

      }  else {
        setState(() {
          now = DateTime.now();
          _counter += temp;
        });
      }
    }
    myController.clear();
  }

  void _reset(request) async {
    const url = 'https://e-nadi.herokuapp.com/workout/freset';
    final response = await request.get(url);
    if (response['w_username'] != ""){
      setState(() {
        now = DateTime.now();
        _username = response['w_username'];
        _counter = response['w_counter'];
      });

    } else {
      setState(() {
        now = DateTime.now();
        _counter = 0;
      });
    }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: getWorkout(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Text("Loading...");
                } else {
                  return const Text("Workout Tracker");
                }
              }
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.sports_handball_outlined),
                    title: Text(now.day.toString() + ' | ' + now.month.toString() + ' | ' + now.year.toString(),
                      style: Theme.of(context).textTheme.headline5,),
                    subtitle: Text(
                      _username,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Time: $_counter minutes',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        TextField(
                          decoration: const InputDecoration(labelText: 'Add to counter'),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}