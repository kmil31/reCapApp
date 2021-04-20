import 'package:flutter/material.dart';
import 'package:recap/sharedwidgets/drawer.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Recap App was made for you!"),
            Center(),
          ],
        ),
      ),
    );
  }
}
