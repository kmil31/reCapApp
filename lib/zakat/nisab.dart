import 'package:flutter/material.dart';
import 'package:recap2/zakat/nisabform.dart';

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
        body: Center(
            child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
            width: 370,
            child: Text('Nisab',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 10.0),
                  ),
                ]),
            padding: EdgeInsets.symmetric(vertical: 13),
            child: Text(
                '''Muslims who own wealth at or above a firm threshold to donate a portion of that wealth, around 2.5% to those who are eligible to pay. To be eligible, you must have around either:
              7.5 tola in gold. ( in physical form)
              52.5 tola in silver.\nPosessions/assets equal to or greater than 52.5 tola in silver.                                   
              \n              1 tola = 11.664grams
              
              Today's Gold Price
                    1 tola = MYR 2802

              Today's Silver Price
                    1 tola = MYR 42''',
                style: TextStyle(
                    fontSize: 18, fontFamily: 'Poppins', color: Colors.black),
                textAlign: TextAlign.left),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(15),
            width: 370,
            child: Text('Zakat Calculator',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Container(child: NisabForm()),
        ])));
  }
}
