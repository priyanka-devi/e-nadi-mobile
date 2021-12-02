// ignore_for_file: prefer_const_constructors, unnecessary_new, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe/RecipeDetail1.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String title = 'Recipe Page';
  const MyApp({Key? key}) : super(key: key);
  MyApp createState() => MyApp();
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _MainPageStateIndex = 3;
  final _formKey = GlobalKey<FormState>();
  String textFieldsValue = "";
  late TextEditingController _controller;
  @override
  List<dynamic> extractedData = [];
  fetchData() async {
    const url = 'https://e-nadi.herokuapp.com/recipe/get_all_comment';
    try {
      final response = await http.get(Uri.parse(url));
      // print(response.body);
      extractedData = jsonDecode(response.body);
      print(extractedData);
      return extractedData;
    } catch (error) {
      print(error);
    }
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      fetchData();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Column(),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Workout',
      style: optionStyle,
    ),
    Text(
      'Index 2: Sleep Advice',
      style: optionStyle,
    ),
    Text(''),
    Text(
      'Index 4: Activity Summary',
      style: optionStyle,
    ),
    Text(
      'Index 5: Healthy Advice',
      style: optionStyle,
    ),
    Text(
      'Index 6: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _MainPageStateIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(Colors.orange.shade800),
            ),
          ),
          child: Scrollbar(
            isAlwaysShown: true,
            thickness: 5,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // _widgetOptions.elementAt(_MainPageStateIndex),
                Container(
                  child: buildRecipeCard1(),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                ),
                Container(
                  child: buildRecipeCard2(),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                ),
                Container(
                  child: buildRecipeCard3(),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                ),
                Container(
                  child: buildRecipeCard4(),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                ),
                Container(
                  child: buildRecipeCard5(),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
                ),
                Container(
                  child: buildRecipeCard6(),
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 50),
                ),
                Container(
                  child: Text('COMMENTS & FEEDBACK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      )),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.url,
                        maxLength: 200,
                        decoration: InputDecoration(
                            hintText: "Enter a Feedback",
                            contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Insert a Feedback';
                          }
                          textFieldsValue = value;
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16),
                          primary: Colors.orange.shade800,
                          onPrimary: Colors.white,
                          side: BorderSide(width: 2, color: Colors.transparent),
                          padding: EdgeInsets.only(
                              left: 12, right: 12, top: 8, bottom: 8),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(textFieldsValue);
                          }
                        },
                        child: const Text('Post'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FutureBuilder(
                          future: fetchData(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return Container(
                                child: Center(
                                    child: Text(
                                  "Loading...",
                                )),
                              );
                            } else {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Text(
                                          snapshot.data[index]["fields"]
                                                  ["username"]
                                              .toString(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          )),
                                      Text(snapshot.data[index]["fields"]
                                              ["post_date"]
                                          .toString()),
                                      Text(
                                          snapshot.data[index]["fields"]
                                                  ["content"]
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 18,
                                          )),
                                      SizedBox(
                                        height: 20,
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
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hotel),
              label: 'Workout Tracker',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.nights_stay),
              label: 'Sleep Tracker',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              label: 'Recipe',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety_outlined),
              label: 'Activity Summary',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_rounded),
              label: 'Healthy Advice',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _MainPageStateIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            setState(() {
              _MainPageStateIndex = index;
            });
          },
        ),
      );

  Widget buildRecipeCard1() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://hips.hearstapps.com/del.h-cdn.co/assets/17/23/1496939954-bruschetta-chicken-1sm.jpg?crop=1.0xw:1xh;center,top&resize=768:*',
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'BRUSCHETTA GRILLED CHICKEN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 1),
              child: Text(
                'Bruschetta Grilled Chicken adalah hidangan pembuka berasal dari Italia, yang lezat dan cocok pada musim panas.',
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
                child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.orange,
                              )))),
                  child: Text('View Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecipeDetail()),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );
  Widget buildRecipeCard2() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/honey-walnut-shrimp-horizontal-1548093880.png',
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'HONEY WALNUT SHRIMP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 1),
              child: Text(
                'Hidangan ini adalah hidangan populer berasal dari Hong Kong yang sering disajikan pada banyak restorant.',
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
                child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.orange,
                              )))),
                  child: Text('View Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecipeDetail()),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );
  Widget buildRecipeCard3() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://hips.hearstapps.com/del.h-cdn.co/assets/16/21/1464039955-delish-summer-salads-caprese-zoodles.jpg',
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'SALAD CAPRESE ZOODLES',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 1),
              child: Text(
                'Salad Caprese Zoodle adalah salad Italia sederhana.Salad ini Biasanya diatur di atas piring dalam praktik restoran.',
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
                child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.orange,
                              )))),
                  child: Text('View Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecipeDetail()),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );
  Widget buildRecipeCard4() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://hips.hearstapps.com/del.h-cdn.co/assets/17/27/1499459298-delish-garlicky-greek-chicken-front00-00-02-20still002.jpg',
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'GARLICKY GREEK CHICKEN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 1),
              child: Text(
                'Terinspirasi oleh masakan populer di Yunani, resep paha ayam yang mudah ini akan menjadi favorit baru untuk kamu.',
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
                child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.orange,
                              )))),
                  child: Text('View Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecipeDetail()),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );
  Widget buildRecipeCard5() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://hips.hearstapps.com/del.h-cdn.co/assets/17/36/1600x2399/gallery-1504715772-delish-baked-salmon-1.jpg?resize=480:*',
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'BAKED SALMON',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 1),
              child: Text(
                'Salmon panggang adalah hidangan makanan terbaik untuk memberi makan orang banyak. Sederhana dan lezat.',
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
                child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.orange,
                              )))),
                  child: Text('View Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecipeDetail()),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );
  Widget buildRecipeCard6() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(
                    'https://hips.hearstapps.com/del.h-cdn.co/assets/17/25/1498147867-delish-easy-crockpot-chicken-and-dumplings-horizontal-1024.jpg?crop=1xw:1xh;center,top&resize=480:*',
                  ),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.darken),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    'CHICKEN SOUP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 1),
              child: Text(
                'Resep sup ayam ini sangat mudah dibuat dan sehat. Gunakan sayuran apa pun yang Anda miliki untuk membuat sup ayam ini.',
                style: TextStyle(fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
                child: ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.orange,
                              )))),
                  child: Text('View Detail'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecipeDetail()),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );
}
