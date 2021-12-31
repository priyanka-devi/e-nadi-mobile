import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:summary/screens/edit_profile.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:accounts/utils/drawer_screen.dart';

Future<List<dynamic>> fetchData(request) async {
  const url = 'https://e-nadi.herokuapp.com/summary/get_profile/';

  final response = await request.get(url);
  return response;
}

class ActivitySummaryApp extends StatefulWidget {
  static const routeName = '/summary';
  final String title;
  const ActivitySummaryApp({Key? key, required this.title}) : super(key: key);

  _ActivitySummaryAppState createState() => _ActivitySummaryAppState();
}

class _ActivitySummaryAppState extends State<ActivitySummaryApp> {
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      appBar: AppBar(
        title: Text("e-Nadi", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.black,
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.black]),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "WELCOME BACK !",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Stay Healthy, Stay Motivated",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "---------------------",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.yellow[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      child: Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Color.fromRGBO(242, 248, 243, 0.5),
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FutureBuilder(
                                        future: fetchData(request),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          return ListView.separated(
                                            shrinkWrap: true,
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    radius: 45.0,
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    snapshot.data[0]["fields"]
                                                            ["username"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    snapshot.data[1]["fields"]
                                                                ["gender"]
                                                            .toString() +
                                                        ' , ' +
                                                        snapshot.data[1]
                                                                ["fields"]
                                                                ["age"]
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data[1]["fields"]
                                                            ["profession"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
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
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Color.fromRGBO(242, 248, 243, 0.5),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  FutureBuilder(
                                      future: fetchData(request),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        return ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: 1,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: <Widget>[
                                                ListTile(
                                                  title: Text(
                                                    "FULL NAME",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    snapshot.data[0]["fields"]
                                                                ["first_name"]
                                                            .toString() +
                                                        " " +
                                                        snapshot.data[0]
                                                                ["fields"]
                                                                ["last_name"]
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  leading: Icon(Icons.people),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "EMAIL",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    snapshot.data[0]["fields"]
                                                            ["email"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  leading: Icon(Icons.email),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "MOBILE",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    snapshot.data[1]["fields"]
                                                            ["mobile"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  leading: Icon(Icons.phone),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "ADDRESS",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    snapshot.data[1]["fields"]
                                                            ["address"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white70,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  leading: Icon(Icons.home),
                                                ),
                                                SizedBox(
                                                  height: 15.0,
                                                ),
                                                TextButton(
                                                  child: Text(
                                                    'EDIT',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .yellow[700]),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditProfileApp()));
                                                  },
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
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "ACTIVITY SUMMARY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Color.fromRGBO(242, 248, 243, 0.5),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  FutureBuilder(
                                      future: fetchData(request),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        return Column(
                                          children: [
                                            Icon(
                                              Icons.fitness_center,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "WORKOUT",
                                              style: TextStyle(
                                                color: Colors.brown[900],
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              snapshot.data[2]["fields"]["time"]
                                                      .toString() +
                                                  " minutes",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              snapshot.data[2]["fields"]
                                                      ["today"]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.brown[800],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  FutureBuilder(
                                      future: fetchData(request),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Icon(
                                              Icons.bed,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              "SLEEP",
                                              style: TextStyle(
                                                color: Colors.brown[900],
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              snapshot.data[3]["fields"]["time"]
                                                      .toString() +
                                                  " hours",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            Text(
                                              snapshot.data[3]["fields"]
                                                      ["today"]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.brown[800],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
