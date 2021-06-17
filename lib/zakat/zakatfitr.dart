import 'package:flutter/material.dart';

import 'package:recap2/zakat/zakatfitrform.dart';

import '../navdrawer.dart';

class ZakatFitr extends StatefulWidget {
  @override
  ZakatFitrState createState() => ZakatFitrState();
}

class ZakatFitrState extends State<ZakatFitr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Zakat al-Fitr",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        titleSpacing: 3.0,
        elevation: 5.0,
        backgroundColor: Colors.white,
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: Text('Zakat al-Fitr',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 250,
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
                  '''Zakat al-Fitr is a zakat that must be paid by every adult who possesses food in excess of their needs, during the month of Ramadhan. The minimum amount is approximately 2.6-3kg of staple food, such as rice or wheat, or the equivalent in cash. You can pay zakat for yourself and for your family.
                  
  This Year's Rate: MYR 7.00
  *price may be different according to state''',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  )),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(20),
              child: Text('Calculator',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(child: ZakatFitrForm()),
          ],
        ),
      ),
    );
  }
}
