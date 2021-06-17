import 'package:flutter/material.dart';
import 'package:recap2/zakat/zakatfitr.dart';

import 'package:recap2/zakat/nisab.dart';

import '../navdrawer.dart';
import 'incomezakat.dart';

class Zakat extends StatefulWidget {
  @override
  ZakatState createState() => ZakatState();
}

class ZakatState extends State<Zakat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Zakat",
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
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              child: Text('What is Zakat?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
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
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  'Zakat (or Zakah) is the giving of a set amount of your wealth to charity. Zakat is the third pillar out of five pillars of Islam. Zakat is extremely important to Muslim and it is mentioned alongside of Salah in the Quran. \n\n"Establish Prayer and pay Zakah and obey the Messenger so that mercy may be shown to you." (An-Nur: 56)',
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                child: Text('Zakat al-Fitr',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal[50],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ZakatFitr()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                child: Text('Income Zakat',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal[50],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IncomeZakat()),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                child: Text('Gold & Silver Zakat',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal[50],
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Nisab()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
