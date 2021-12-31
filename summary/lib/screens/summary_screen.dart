import 'package:flutter/material.dart';
import 'package:summary/screens/edit_profile.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:provider/provider.dart';
import 'package:accounts/utils/drawer_screen.dart';

fetchData(request) async {
  const url = 'https://e-nadi.herokuapp.com/summary/get_profile/';

  final response = await request.get(url);
  return response;
}

class ActivitySummaryApp extends StatefulWidget {
  static const routeName = '/summary';
  final String title;
  const ActivitySummaryApp({Key? key, required this.title}) : super(key: key);

  @override
  _ActivitySummaryAppState createState() => _ActivitySummaryAppState();
}

class _ActivitySummaryAppState extends State<ActivitySummaryApp> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(241, 230, 255, 0.7),
                      Color.fromRGBO(241, 230, 255, 0.7)
                    ]),
                image: DecorationImage(
                  image: AssetImage("assets/images/login_bottom.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text(
                      "WELCOME BACK !",
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Stay Healthy, Stay Motivated",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "---------------------",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 13.0,
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
                                        if (snapshot.data == null) {
                                          return const Text("Loading...");
                                        } else {
                                          return ListView.separated(
                                            shrinkWrap: true,
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  const CircleAvatar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    radius: 45.0,
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    snapshot.data[0]["fields"]
                                                            ["username"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const SizedBox(
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
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data[1]["fields"]
                                                            ["profession"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return const Divider(
                                                thickness: 1,
                                              );
                                            },
                                          );
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 13.0,
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
                                        if (snapshot.data == null) {
                                          return const Text("Loading...");
                                        } else {
                                          return ListView.separated(
                                            shrinkWrap: true,
                                            itemCount: 1,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: <Widget>[
                                                  ListTile(
                                                    title: const Text(
                                                      "FULL NAME",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black,
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
                                                        color:
                                                            Colors.brown[900],
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    leading: const Icon(
                                                        Icons.people),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                      "EMAIL",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black,
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
                                                        color:
                                                            Colors.brown[900],
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    leading:
                                                        const Icon(Icons.email),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                      "MOBILE",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black,
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
                                                        color:
                                                            Colors.brown[900],
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    leading:
                                                        const Icon(Icons.phone),
                                                  ),
                                                  ListTile(
                                                    title: const Text(
                                                      "ADDRESS",
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black,
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
                                                        color:
                                                            Colors.brown[900],
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    leading:
                                                        const Icon(Icons.home),
                                                  ),
                                                  const SizedBox(
                                                    height: 15.0,
                                                  ),
                                                  TextButton(
                                                    child: const Text(
                                                      'EDIT',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors
                                                                  .indigo),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const EditProfileApp(
                                                                      title:
                                                                          'e-nadi Edit Profile')));
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return const Divider(
                                                thickness: 1,
                                              );
                                            },
                                          );
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Text(
                      "ACTIVITY SUMMARY",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 20.0,
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
                                        if (snapshot.data == null) {
                                          return const Text("Loading...");
                                        } else {
                                          return Column(
                                            children: [
                                              const Icon(
                                                Icons.fitness_center,
                                                size: 25,
                                              ),
                                              const SizedBox(
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
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                snapshot.data[2]["fields"]
                                                            ["time"]
                                                        .toString() +
                                                    " minutes",
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
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
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                            ],
                                          );
                                        }
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
                                        if (snapshot.data == null) {
                                          return const Text("Loading...");
                                        } else {
                                          return Column(
                                            children: [
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              const Icon(
                                                Icons.bed,
                                                size: 25,
                                              ),
                                              const SizedBox(
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
                                              const SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                snapshot.data[3]["fields"]
                                                            ["time"]
                                                        .toString() +
                                                    " hours",
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(
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
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                            ],
                                          );
                                        }
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
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
