import 'package:flutter/material.dart';

class Zakat extends StatefulWidget {
  @override
  ZakatState createState() => ZakatState();
}

class ZakatState extends State<Zakat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5.0,
        elevation: 5.0,
        backgroundColor: Color(0xff201F23),
        title: Text('Zakat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(20),
              child: Text('What is Zakat?',
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
                  'Zakat (or Zakah) is the giving of a set amount of your wealth to charity. Zakat is the third pillar out of five pillars of Islam. Zakat is extremely important to Muslim and it is mentioned alongside of Salah in the Quran. \n\n"Establish Prayer and pay Zakah and obey the Messenger so that mercy may be shown to you." (An-Nur: 56)',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ),
            Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    child: Text('Zakat al-Fitr',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[200],
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    })),
            Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    child: Text('Income Zakat',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[200],
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    })),
            Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    child: Text('Gold & Silver Zakat',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[200],
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    })),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
