library sleep;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-Nadi',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sleep Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: Color(0xFFFFFFFF),
  );

  int _counter = 0;
  String _condition = "Please Update Your Sleep";
  String _date = "18 - November - 2021";
  bool _update = false;

  TextEditingController _hours = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if (_counter < 24) {
        _counter++;
        _changeCondition();
      }
    });
  }

  void _changeCondition() {
    setState(() {
      if (_counter < 5) {
        _condition = "You Need More Sleep";
      } else if (_counter < 7) {
        _condition = "Almost There";
      } else if (_counter < 9) {
        _condition = "Well Done";
      } else if (_counter < 15) {
        _condition = "You Must Be Really Tired";
      } else {
        _condition = "I Think This Is Too Much Sleep";
      }
    });
  }

  void _updateCondition() {
    setState(() {
      if(_update == false){
        _update = true;
      } else{
        _update = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: Column(
            children: <Widget>[
              ListTileTheme(
                  minVerticalPadding: 20,
                  child: Text(
                    'e-Nadi',
                    style: style1,
                  )),
              ListTile(
                title: Text(
                  'Home',
                  style: style1,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Workout Tracker',
                  style: style1,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Sleep Tracker',
                  style: style1,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Recipe',
                  style: style1,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Activity Summary',
                  style: style1,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Healthy Advice',
                  style: style1,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Username',
                  style: style1,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("Tell Us About Your Sleep Today!")),
              ],
            ),
            height: 100,
            width: double.infinity,
            color: Colors.blueAccent,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("About Your Sleep"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                Text(
                    "Date: $_date\nYour Sleep Time: $_counter Hours\nSleep Quality: $_condition"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    TextButton(
                      child: new Text('Update'),
                      onPressed: () {
                        if (_update == false){
                          _updateCondition();
                        }
                      },
                    ),

                    TextButton(
                      child: Text('Reset'),
                      onPressed: () {
                        _counter = 0;
                        _changeCondition();
                        if (_update == true){
                          _updateCondition();
                        }
                      },
                    ),

                  ],
                ),

                if (_update == true)
                  TextFormField(
                    controller: _hours,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      fillColor: Color(0xffF1F0F5),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value){
                      return (value != null)
                          ? 'Field is required'
                          : null;
                    },
                  ),

                if (_update == true)
                  TextButton(
                    child: Text('Submit'),
                    onPressed: () {
                      int _text = int.parse(_hours.text);
                      if(_text>-1 && _text<25) {
                        _counter = _text;
                        _changeCondition();
                        _updateCondition();
                      }
                      else {
                        print('Input must be a number in range 0-24');
                      }
                    },
                  ),

              ],
            ),
            //style: Theme.of(context).textTheme.headline4,),
          ),
          Container(
            child: Column(
              children: [
                Container(child: Text("About Us")),
              ],
            ),
            height: 100,
            width: double.infinity,
            color: Colors.blueAccent,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

