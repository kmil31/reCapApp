import 'package:flutter/material.dart';

import 'package:recap2/zakat/incomeform.dart';

import '../navdrawer.dart';

class IncomeZakat extends StatefulWidget {
  @override
  IncomeZakatState createState() => IncomeZakatState();
}

class IncomeZakatState extends State<IncomeZakat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Income Zakat",
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
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: Text('Income Zakat',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 150,
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
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                  'Income zakat is all types of wages, remuneration, payments earned from work or efforts undertaken either on a regular basis or once in a while.',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      color: Colors.black)),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: Text('Zakat Calculator',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(child: IncomeForm()),
          ],
        ),
      ),
    );
  }
}
