// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:recipe/widgets/carouselRecipe.dart';

class RecipeDetail6 extends StatelessWidget {
  const RecipeDetail6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://m.media-amazon.com/images/I/61tNcU3oKjL._AC_SL1500_.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Chicken Soup"),
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
            child: SingleChildScrollView(
                child:
                Column(
                    children: <Widget>[
                      Container(
                        height: 400,
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
                                'https://hips.hearstapps.com/del.h-cdn.co/assets/17/25/1498147867-delish-easy-crockpot-chicken-and-dumplings-horizontal-1024.jpg?crop=1xw:1xh;center,top&resize=480:*',
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
                      Stack(
                        children: [
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
                              )
                          ),

                        ],
                      )

                    ]

                ),
            ),
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
                    ''' 1. Taburkan bawang bombay di bagian bawah slow cooker besar, lalu taburi dengan ayam. Bumbui dengan oregano, garam, dan merica.

2. Tuang sup dan kaldu di atas ayam, lalu tambahkan thyme dan daun salam. Tutup dan masak di High sampai ayam matang, sekitar 3 jam
              
3. Buang thyme dan daun salam, lalu suwir ayam dengan dua garpu. Aduk seledri, wortel, kacang polong, dan bawang putih. Potong atau sobek biskuit menjadi potongan-potongan kecil lalu aduk ke dalam campuran ayam. Sendokkan cairan di atas biskuit apa pun di atasnya.
          
4. Masak dengan mode Tinggi hingga sayuran empuk dan biskuit matang, aduk setiap 30 menit, sekitar 1 jam hingga 1 jam 30 menit lagi
          
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

3 sdm. minyak zaitun extra-virgin, dan peras jus dari 1 lemon

3 siung bawang putih, cincang

1 sendok teh. Bumbu Italia atau oregano kering

1 pons paha ayam

garam dan lada hitam yang fresh

1/2 pon asparagus, buang ujungnya

1 zucchini, diiris menjadi setengah bulan

1 lemon, di iris
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
