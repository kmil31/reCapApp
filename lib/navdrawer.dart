import 'package:flutter/material.dart';
import 'package:recap2/analytics/analytics.dart';
import 'package:recap2/services/authlogic.dart';
import 'package:recap2/services/userdetails.dart';
import 'package:recap2/transactions/translist.dart';
import 'package:recap2/about.dart';

import 'home/home.dart';

// this class is our navigation. routes should be defined here

// ignore: must_be_immutable
class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final authlogic = new AuthLogic();
  final userDetails = new UserDetails();

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
                    pageBuilder: (c, a1, a2) => WillPopScope(
                        onWillPop: () async => false, child: HomePage()),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 250),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit_sharp),
            title: Text('List'),
            onTap: () async {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => TransactionList(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 250),
                  ));
            },
          ),
          ListTile(
              leading: Icon(Icons.south),
              title: Text('About'),
              onTap: () async {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => About(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 250),
                    ));
              }),
          ListTile(
              leading: Icon(Icons.data_usage_rounded),
              title: Text('Analytics'),
              onTap: () async {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => Analytics(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 250),
                    ));
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () async {
                await authlogic.signOut(context);
                try {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                } catch (e) {
                  print("Exception occured but no crash");
                }

                // Pops All Routes until u hit landing page
              }),
        ],
      ),
    );
  }
}
