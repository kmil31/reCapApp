import 'package:flutter/material.dart';
import 'package:recap/sharedwidgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReCap Home"),
        titleSpacing: 5.0,
        elevation: 5.0,
        backgroundColor: Color(0xff201F23),
      ),
      drawer: DrawerMenu(),
    );
  }
}
