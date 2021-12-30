// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recipe/widgets/carouselRecipe.dart';

class RecipeDetail2 extends StatelessWidget {
  const RecipeDetail2({Key? key}) : super(key: key);

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
          title: const Text("Honey Walnut Shrimp"),
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
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/honey-walnut-shrimp-horizontal-1548093880.png',
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
                    ''' 1. Dalam panci kecil di atas api sedang, gabungkan air dan gula dan didihkan.

2.  Tambahkan kenari dan biarkan mendidih selama 2 menit. Dengan menggunakan sendok berlubang, keluarkan kenari dan biarkan dingin di atas loyang kecil.
              
3. Keringkan udang dengan handuk kertas dan bumbui dengan garam dan merica. Tempatkan telur dalam mangkuk dangkal dan tepung jagung di mangkuk dangkal lainnya. 
          
4. Celupkan udang ke dalam telur, lalu dalam lapisan tepung maizena dengan baik.

5. Dalam wajan besar di atas api sedang, panaskan 1" minyak. Tambahkan udang dalam batches dan goreng sampai berwarna keemasan, 3 hingga 4 menit. 

6. Angkat dengan sendok berlubang dan letakkan di atas piring berlapis handuk kertas.
          
7. Dalam mangkuk sedang, aduk bersama mayones, madu, dan krim kental. Aduk udang dalam saus. Sajikan di atas nasi dengan manisan kenari dan hiasi dengan daun bawang.
          
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

1 c. air

1c. gula pasir

1 c. walnuts

1 pon udang, kupas dan buang kulitnya, lalu siapkan kosher salt

Lada hitam Fresh yang baru digiling

2 butir telur besar, yang sudah di kocok

1 gelas. tepung maizena dan minyak sayur untuk menggoreng

1/4 c. mayones

2 sdm. madu

2 sdm. heavy cream

Nasi putih matang, untuk disajikan Iris tipis daun bawang, untuk hiasan
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
