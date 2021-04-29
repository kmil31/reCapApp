import 'package:flutter/material.dart';
import 'package:recap/sharedwidgets/drawer.dart';
import 'package:recap/screens/zakat/nisabform.dart';

class Nisab extends StatefulWidget {
  @override
  NisabState createState() => NisabState();
}

class NisabState extends State<Nisab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Gold & Silver Zakat",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          titleSpacing: 3.0,
          elevation: 5.0,
          backgroundColor: Colors.white,
        ),
        drawer: DrawerMenu(),
        body: Center(
            child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(15),
            width: 370,
            child: Text('Nisab',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(24.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Text(
                'Income zakat is all types of wages, remuneration, payments earned from work or efforts undertaken either on a regular basis or once in a while.',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.topLeft,
            child: Text('''
            Today's Gold Price
                    1 tola = MYR 2802

            Today's Silver Price
                    1 tola = MYR 42
                ''', style: TextStyle(fontSize: 16, color: Colors.black)),
          ),
          Container(child: NisabForm()),
        ])));
  }
}
