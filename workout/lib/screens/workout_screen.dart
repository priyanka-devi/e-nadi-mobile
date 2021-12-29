import 'package:accounts/utils/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class WorkoutPage extends StatefulWidget {
  static const routeName = '/workout';
  const WorkoutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  int _counter = 0;
  String _username = "";
  DateTime now = DateTime.now();
  final myController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter += int.tryParse(myController.text)!;
      myController.clear();
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.sports_handball_outlined),
                    title: Text(now.day.toString() + ' | ' + now.month.toString() + ' | ' + now.year.toString(),
                      style: Theme.of(context).textTheme.headline5,),
                    subtitle: Text(
                      'User',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
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
                                _incrementCounter();
                              },
                              child: const Text('UPDATE'),
                            ),
                            TextButton(
                              //textColor: const Color(0xFF6200EE),
                              onPressed: () {
                                // Perform some action
                                _reset();
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