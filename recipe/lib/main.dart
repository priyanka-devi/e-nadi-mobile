// ignore_for_file: prefer_const_constructors, unnecessary_new, non_constant_identifier_names, unused_field, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe/pages/RecipeDetail.dart';
import 'package:recipe/pages/RecipeDetail_2.dart';
import 'package:recipe/pages/RecipeDetail_3.dart';
import 'package:recipe/pages/RecipeDetail_4.dart';
import 'package:recipe/pages/RecipeDetail_5.dart';
import 'package:recipe/pages/RecipeDetail_6.dart';
import 'package:http/http.dart' as http;
import 'package:recipe/model/comment_recipe.dart';
import 'package:recipe/widgets/card_comment.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';
import 'package:accounts/utils/drawer_screen.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:provider/provider.dart';

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
        home: RecipePage(title: title),
      );
}

class RecipePage extends StatefulWidget {
  final String title;
  static const routeName = '/recipe';
  const RecipePage({
    required this.title,
  });

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final _formKey = GlobalKey<FormState>();
  String textFieldsValue = "";
  late TextEditingController _controller;

  bool isUser = false;
  //Ganti nama isi Comment
  List<IsiComment> extractedData = [];
  fetchData() async {
    // const url = 'https://e-nadi.herokuapp.com/recipe/get_all_comment';
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8000/recipe/get_all_comment'));
    if (response.statusCode == 200) {
      try {
        extractedData = [];
        // final response = await http.get(Uri.parse(url));
        final dataJson = jsonDecode(response.body);
        for (var i in dataJson) {
          Fields fields = Fields(
              commentatorName: i["fields"]["username"],
              commentField: i["fields"]["content"],
              commentDate: i["fields"]["post_date"]);
          IsiComment comment =
              IsiComment(model: i["model"], pk: i["pk"], fields: fields);
          extractedData.add(comment);
        }
        print(extractedData.length);
        return extractedData;
      } catch (error) {
        print(error);
      }
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    request.username != "" ? isUser = true : isUser = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: isUser ? const DrawerScreen() : const DrawerScreen(),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // _widgetOptions.elementAt(_RecipePageStateIndex),
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
                  autofocus: false,
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
                    padding:
                        EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0)),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                          "http://10.0.2.2:8000/recipe/addAPI",
                          convert.jsonEncode(<String, String>{
                            'commentator_name': request.username,
                            'comment_field': textFieldsValue.toString(),
                            'comment_date': cdate
                          }));
                      if (response["status"] == "success") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Comment success"),
                        ));

                        Navigator.pushReplacementNamed(
                            context, RecipePage.routeName);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Please try again."),
                        ));
                      }
                      // print(textFieldsValue);
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
                        return Center(
                            child: Text(
                          "Loading...",
                        ));
                      } else {
                        return Column(
                            children: extractedData.map((i) {
                          return CardComment(
                            commentatorName: i.fields.commentatorName,
                            commentField: i.fields.commentField,
                            commentDate: i.fields.commentDate,
                            commentPk: i.pk,
                          );
                        }).toList());
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
                  image: AssetImage('assets/recipie/recipe1.jpg'),
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
                  image: AssetImage('assets/recipie/recipe2.png'),
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
                          builder: (context) => const RecipeDetail2()),
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
                  image: AssetImage('assets/recipie/recipe3.jpg'),
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
                          builder: (context) => const RecipeDetail3()),
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
                  image: AssetImage('assets/recipie/recipe4.jpg'),
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
                          builder: (context) => const RecipeDetail4()),
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
                  image: AssetImage('assets/recipie/recipe5.jpg'),
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
                          builder: (context) => const RecipeDetail5()),
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
                  image: AssetImage('assets/recipie/recipe6.jpg'),
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
                          builder: (context) => const RecipeDetail6()),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      );
}
