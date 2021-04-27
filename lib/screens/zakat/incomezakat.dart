import 'package:flutter/material.dart';
import 'package:recap/sharedwidgets/drawer.dart';

class IncomeZakat extends StatefulWidget {
  @override
  IncomeZakatState createState() => IncomeZakatState();
}

class IncomeZakatState extends State<IncomeZakat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 5.0,
          elevation: 5.0,
          backgroundColor: Color(0xff201F23),
          title: Text('Income Zakat'),
        ),
        drawer: DrawerMenu(),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(20),
                child: Text('Zakat al-Fitr',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                color: Colors.green[100],
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                    'Income zakat is all types of wages, remuneration, payments earned from work or efforts undertaken either on a regular basis or once in a while.',
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              ),
            ])));
  }
}
