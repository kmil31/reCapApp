import 'package:flutter/material.dart';

import 'package:recap2/navdrawer.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "About Page",
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
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Image.asset(
              "assets/image/recap.png",
              height: 150.0,
            ),
            SizedBox(height: 20),
            Divider(
              height: 20,
              thickness: 5,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "ReCap is an ad-free financial tracking application developed by Muhammad Kamiel and Hannah Huda for their FYP.",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Special thanks to Dr Mira Kartiwi for helping us throughout the entirety of this project!",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 8,
                color: Colors.amberAccent,
                child: Column(
                  children: [
                    Text(
                      "Contact us by e-mail at:",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    Text("mkamiel.98@gmai.com"),
                    Text("hannah.huda@gmail.com")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
