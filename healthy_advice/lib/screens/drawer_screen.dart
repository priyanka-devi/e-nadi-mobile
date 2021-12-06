import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Priyanka Devi"),
            accountEmail: Text("priyankadevi64@gmail.com"),
          ),
          DrawerListTile(
            iconData: Icons.home,
            title: "Home",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData : Icons.assignment_turned_in_rounded,
            title: "Workout Tracker",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.airline_seat_individual_suite,
            title: "Sleep Tracker",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.flatware_outlined,
            title: "Recipe",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.article,
            title: "Activity Summary",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.apartment,
            title: "Healthy Advice",
            onTilePressed: () {

            },
          ),
          DrawerListTile(
            iconData: Icons.arrow_back_rounded,
            title: "Log out",
            onTilePressed: () {

            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData ;
  final String title;
  final VoidCallback onTilePressed;
  const DrawerListTile({Key? key, required this.iconData, required this.title, required this.onTilePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(title, style: TextStyle(fontSize: 16),),
    );
  }
}