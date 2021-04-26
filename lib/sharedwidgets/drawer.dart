import 'package:flutter/material.dart';

import 'package:animations/animations.dart';
import 'package:recap/screens/home/home.dart';
import 'package:recap/screens/zakat/zakatmain.dart';
import 'package:recap/services/authservice.dart';
import 'package:recap/services/userdetails.dart';

// this class is our navigation. routes should be defined here

// ignore: must_be_immutable
class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  UserDetails userDetails = UserDetails();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              userDetails.getUsername(),
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              userDetails.getEmail(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(userDetails.getDisplayUrl()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () async {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => HomePage(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 250),
                  ));
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
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (c, a1, a2) => Zakat(),
                  transitionsBuilder: (c, anim, a2, child) =>
                      FadeTransition(opacity: anim, child: child),
                  transitionDuration: Duration(milliseconds: 250),
                ),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () async {
                await AuthService().signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/wrapper', (route) => false);
              }),
          ListTile(
              leading: Icon(Icons.south),
              title: Text('About'),
              onTap: () async {}),
        ],
      ),
    );
  }
}
