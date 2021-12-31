import 'package:enadi_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:healthy_advice/screens/healthy_advice_home.dart';
import 'package:provider/provider.dart';
import 'package:accounts/utils/network_service.dart';
import 'package:recipe/main.dart';
import 'package:accounts/screens/welcome_screen.dart';


class DrawerNotLoginScreen extends StatefulWidget {
  const DrawerNotLoginScreen({Key? key}) : super(key: key);

  @override
  _DrawerNotLoginScreenState createState() => _DrawerNotLoginScreenState();
}

class _DrawerNotLoginScreenState extends State<DrawerNotLoginScreen> {
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
            iconData: Icons.flatware_outlined,
            title: "Recipe",
            onTilePressed: () {
              Navigator.pushReplacementNamed(context, RecipePage.routeName);
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
          DrawerListTile(
            iconData: Icons.arrow_right_alt_outlined,
           title: "Login/Sign Up",
            onTilePressed: () {
              Navigator.pushReplacementNamed(
                  context, WelcomeScreen.routeName);
            },
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
