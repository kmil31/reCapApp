import 'package:flutter/material.dart';
import 'package:recap/screens/about/about.dart';
import 'package:recap/screens/home/home.dart';
import 'package:recap/screens/login/login.dart';
import 'package:recap/screens/zakat/zakatmain.dart';
import 'package:recap/services/authservice.dart';

// this class is our navigation. routes should be defined here

// ignore: must_be_immutable
class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String name = "";

  Route _routeToLogin() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Login(),
    );
  }

  Route _routeToZakat() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Zakat(),
    );
  }

  Route _routeToHome() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
    );
  }

  Route _routeToAbout() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => About(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () async {
              Navigator.of(context).push(_routeToHome());
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('Zakat'),
            onTap: () async {
              Navigator.of(context).push(_routeToZakat());
            },
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () async {
                AuthService().signOut();
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('About'),
              onTap: () async {}),
        ],
      ),
    );
  }
}
