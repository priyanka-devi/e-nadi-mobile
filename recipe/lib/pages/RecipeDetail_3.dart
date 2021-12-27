// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recipe/widgets/carouselRecipe.dart';

class RecipeDetail_3 extends StatelessWidget {
  const RecipeDetail_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://c0.wallpaperflare.com/preview/457/952/1022/paper-texture-structure-stained-paper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Salad Caprese Zoodles"),
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
            child: ListView(children: <Widget>[
              Container(
                height: 550,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(63),
                      bottomRight: Radius.circular(63),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 60,
                        color: Colors.grey,
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://hips.hearstapps.com/del.h-cdn.co/assets/16/21/1464039955-delish-summer-salads-caprese-zoodles.jpg',
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                child: buildCardRecipeStep(),
                margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
              ),
              Container(
                child: buildCardRecipeIng(),
                margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
              ),
              Container(
                child: Text('FEATURED RECIPE',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                margin: EdgeInsets.fromLTRB(20, 30, 0, 20),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: CarouselRecipe(),
              ),
              Positioned(
                  child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                      color: Colors.transparent,
                                    )))),
                    child: Text('Go back!'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildCardRecipeStep() => Card(
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How to Make It',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                child: Text(
                    ''' 1. Menggunakan spiralizer, buat zoodles dari zucchini.

2.  Tambahkan zoodles ke mangkuk besar, aduk dengan minyak zaitun dan bumbui dengan garam dan merica. Diamkan 15 menit.
              
3. Tambahkan tomat, mozzarella, dan basil ke zoodles dan aduk hingga rata.
          
4. Hiasi dengan balsamic dan sajikan.
          
          ''',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
            ],
          ),
        ),
      );
  Widget buildCardRecipeIng() => Card(
        shadowColor: Colors.grey,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                child: Text('''

4 zucchini besar

2 sdm. minyak zaitun extra-virgin dan garam

Lada hitam Fresh yang baru digiling

2 c. tomat ceri, dibelah dua

1 c. bola mozzarella, belah empat jika besar

1/4 c. daun basil segar

2 sdm. cuka balsamik
                    ''',
                    textAlign: TextAlign.center,
                    maxLines: 20,
                    style: TextStyle(
                      fontSize: 18,
                    )),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
            ],
          ),
        ),
      );
}
