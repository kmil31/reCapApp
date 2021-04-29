import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recap/screens/analytics/analytics.dart';
import 'package:recap/screens/home/todayspending.dart';
import 'package:recap/screens/home/totalspending.dart';
import 'package:recap/screens/transactions/transactions.dart';
import 'package:recap/screens/zakat/zakatmain.dart';
import 'package:recap/services/userdetails.dart';
import 'package:recap/sharedwidgets/constants.dart';
import 'package:recap/sharedwidgets/drawer.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserDetails userDetails = UserDetails();
  var budget = 446;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "ReCap Home",
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
          child: ListView(children: [
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  height: 38,
                  width: 219,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xff056839),
                  ),
                  child: Center(
                    child: Text('REMAINING BUDGET',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(height: 10),
                Text("RM " + budget.toString(),
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
                SizedBox(height: 60),
                TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black26, width: 0),
                  ))),
                  child: Text(
                    "SET BUDGET",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(height: 40),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Hi " + userDetails.getUsername() + "!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                SizedBox(height: 20),
                Container(
                  height: 38,
                  width: 219,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xff056839),
                  ),
                  child: Center(
                    child: Text(DateFormat.LLLL().format(DateTime.now()),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TotalSpending(),
                    TodaySpending(),
                  ],
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => TransactionPage(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 250),
                        ));
                  },
                  child: Container(
                    height: 97,
                    width: 365,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            'Transactions',
                            style: GoogleFonts.getFont('Poppins',
                                textStyle: hometextstyling),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => Zakat(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 250),
                        ));
                  },
                  child: Container(
                    height: 97,
                    width: 365,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            'Zakat',
                            style: GoogleFonts.getFont('Poppins',
                                textStyle: hometextstyling),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => AnalyticsPage(),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(milliseconds: 250),
                        ));
                  },
                  child: Container(
                    height: 97,
                    width: 365,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            'Analytics',
                            style: GoogleFonts.getFont('Poppins',
                                textStyle: hometextstyling),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ]),
        ));
  }

  changeScreen() {
    return TransactionPage();
  }
}
