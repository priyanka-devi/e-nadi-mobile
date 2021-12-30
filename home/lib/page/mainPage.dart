import 'package:flutter/material.dart';
import './Drawer.dart';
import './PageSatu.dart';
import './FeedBack.dart';
import './ListNews.dar.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("E - Nadi"),
      ),
      body: ListView(
          children:[


            Container(
              height : 300,
              color:  Color(0xFF212121),
              child: Image(

                  image: NetworkImage("https://e-nadi.herokuapp.com/static/img/nav-logo2.png")
              ),
            ),

            Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Container(
                      height: 250,
                      color: Colors.tealAccent,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://e-nadi.herokuapp.com/static/img/oranglari.jpg"),
                      ),
                    ),


                    ListTile(

                      title: Text('NEWS'),
                      subtitle: Text('Keep update by seeing recent headlines'),
                    ),
                    Row(

                      children: <Widget>[
                        TextButton(
                          child:  Text('More'),
                          onPressed: (){
                            print("hello ");
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ListNews(),),
                            );
                          },
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),

            Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Container(
                      height: 250,
                      color: Colors.tealAccent,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://e-nadi.herokuapp.com/static/img/oranglari.jpg"),
                      ),
                    ),


                    ListTile(

                      title: Text('Workout'),
                      subtitle: Text('stay healthy by tracking your workout activity.'),
                    ),
                    Row(

                      children: <Widget>[
                        TextButton(
                          child:  Text('More'),
                          onPressed: () {/* ... */},
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Container(
                      height: 250,
                      color: Colors.tealAccent,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://e-nadi.herokuapp.com/static/img/koalabobo.jpg"),
                      ),
                    ),


                    ListTile(

                      title: Text('having enough sleep ?'),
                      subtitle: Text('Sleep is an essential function, it can recharge your body and mind.'),
                    ),
                    Row(

                      children: <Widget>[
                        TextButton(
                          child:  Text('More'),
                          onPressed: () {/* ... */},
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Container(
                      height: 250,
                      color: Colors.tealAccent,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://e-nadi.herokuapp.com/static/img/healthydiet.jpg"),
                      ),
                    ),


                    ListTile(

                      title: Text('THE MENU'),
                      subtitle: Text('trouble finding right diet ? why not try ours ??.'),
                    ),
                    Row(

                      children: <Widget>[
                        TextButton(
                          child:  Text('More'),
                          onPressed: () {/* ... */},
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Container(
                      height: 250,
                      color: Colors.tealAccent,
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://e-nadi.herokuapp.com/static/img/yogakeren.jpg"),
                      ),
                    ),


                    ListTile(

                      title: Text('HEALTHY ADVICE'),
                      subtitle: Text('Increase your knowledge and motivation.'),
                    ),
                    Row(

                      children: <Widget>[
                        TextButton(
                          child:  Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  FlatButton(
                    child : Text("Feedback"),
                    color : Colors.black,
                    textColor: Colors.white,
                    onPressed: (){
                     // print("hello ");
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Feedpage(),),
                      );
                    },

                  ),


                ]

            ),

          ]







      ),

      drawer:DrawerPage(),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_food_beverage),
            label: 'Recipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sanitizer),
            label: 'Advice',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF9D371E),
        onTap: _onItemTapped,
      ),










    );


  }

}

