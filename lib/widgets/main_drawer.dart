import 'package:flutter/material.dart';
import 'package:navigationproject/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({ Key? key }) : super(key: key);

  void openSettingsScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/');
  }

  void openFilterScreen(BuildContext context) {
   Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);

  }

  Widget drawerContent(Function _func, IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      onTap: () => _func(),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            // ignore: deprecated_member_use
            color: Theme.of(context).accentColor,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          drawerContent(
              () => openSettingsScreen(context), Icons.restaurant, 'Meals'),
          drawerContent(
              () => openFilterScreen(context), Icons.settings, 'Settings'),
        ],
      ),
    );
  }
}
