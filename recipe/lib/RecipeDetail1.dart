// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/backgrounds%2Fdave-hoefler-PEkfSAxeplg-unsplash.jpg?alt=media&token=8b7e1d44-a52f-49f9-a3ae-e542cca0f368"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Bruschetta Grilled Chicken"),
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
            child: ListView(children: [
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
                        color: Colors.orange.shade800.withOpacity(0.80),
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://hips.hearstapps.com/del.h-cdn.co/assets/17/23/1496939954-bruschetta-chicken-1sm.jpg?crop=1.0xw:1xh;center,top&resize=768:*',
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
                    ''' 1. Dalam mangkuk kecil, campurkan minyak, setengah jus lemon, 1 sendok teh garam, 1/4 sendok teh merica, dan bumbu Italia (atau oregano) dan kocok hingga tercampur. 

2. Pindahkan ke tas besar yang bisa ditutup kembali bersama dengan ayam; segel dan dinginkan selama 30 menit.
              
3. Panaskan panggangan di atas sedang-tinggi lalu tambahkan ayam, buang sisa bumbunya. Panggang sampai hangus dan matang dengan suhu internal 165 °, sekitar 5 hingga 7 menit per sisi.
          
4. Sementara itu, campurkan tomat, bawang putih, kemangi, dan sisa air jeruk lemon, lalu bumbui dengan garam dan merica. 

5. Saat ayam masih di panggangan, tutupi setiap dada dengan 1 irisan mozzarella dan tutup sampai keju meleleh, 2 hingga 3 menit. Top ayam dengan campuran tomat.
          
6. Hiasi dengan Parmesan dan sajikan
          
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

4 sendok teh. minyak zaitun extra-virgin dan Jus dari 1 lemon. 

garam kosher dan Lada hitam yang baru digiling

1 sendok teh. Bumbu Italia atau oregano kering 
                    
4 dada ayam bebas antibiotik tanpa kulit tanpa tulang, ditumbuk hingga ketebalan merata

2 siung bawang putih, cincang

1 sendok teh. basil yang baru dicincang
 
4 potong mozarella Parmesan yang baru diparut, untuk disajikan
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
