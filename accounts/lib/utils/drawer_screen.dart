import 'package:accounts/screens/login_screen.dart';
import 'package:enadi_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/healthy_advice_home.dart';
import 'package:provider/provider.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:recipe/main.dart';
import 'package:workout/screens/workout_screen.dart';
import 'package:summary/screens/summary_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            // ignore: unnecessary_string_interpolations
            accountName: Text("${request.username}"), accountEmail: null,
          ),
          DrawerListTile(
            iconData: Icons.home,
            title: "Home",
            onTilePressed: () {
              Navigator.pushReplacementNamed(context, HomeDummy.routeName);
            },
          ),
          DrawerListTile(
            iconData: Icons.assignment_turned_in_rounded,
            title: "Workout Tracker",
            onTilePressed: () {
              Navigator.pushReplacementNamed(context, WorkoutPage.routeName);
            },
          ),
          DrawerListTile(
            iconData: Icons.airline_seat_individual_suite,
            title: "Sleep Tracker",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.flatware_outlined,
            title: "Recipe",
            onTilePressed: () {
              Navigator.pushReplacementNamed(context, RecipePage.routeName);
            },
          ),
          DrawerListTile(
            iconData: Icons.article,
            title: "Activity Summary",
            onTilePressed: () {
              Navigator.pushReplacementNamed(
                  context, ActivitySummaryApp.routeName);
            },
          ),
          DrawerListTile(
            iconData: Icons.apartment,
            title: "Healthy Advice",
            onTilePressed: () {
              Navigator.pushReplacementNamed(
                  context, HealthyAdviceHome.routeName);
            },
          ),
          ElevatedButton(
            onPressed: () async {
              final response = await request.logoutAccount(
                  "https://e-nadi.herokuapp.com/authentication/logout_flutter/");
              if (response['status']) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Successfully logged out!"),
                ));
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Failed to Logout"),
                ));
              }
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;
  const DrawerListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      required this.onTilePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
