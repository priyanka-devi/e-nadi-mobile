import 'package:flutter/material.dart';
import './PageSatu.dart';




class DrawerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Drawer(
      child:Material(
        child : ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF212121),

              ),

              child: Text(
                'E-Nadi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PageSatu(),),
                );
              },
              leading: Icon(Icons.message),
              title: Text('FeedBack'),



            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}