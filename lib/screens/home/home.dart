import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recap/services/userdetails.dart';
import 'package:recap/sharedwidgets/constants.dart';
import 'package:recap/sharedwidgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserDetails userDetails = UserDetails();
  var budget = 5;

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
          titleSpacing: 5.0,
          elevation: 5.0,
          backgroundColor: Colors.white,
        ),
        drawer: DrawerMenu(),
        body: Center(
          child: Column(
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
              SizedBox(height: 20),
              Text("RM " + budget.toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
              SizedBox(height: 60),
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26, width: 0),
                ))),
                child: Text(
                  "Set a new budget",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(height: 40),
              Align(
                  alignment: Alignment.centerLeft,
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
                  child: Text(DateTime.now().month.toString(),
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
                  Container(
                    height: 96,
                    width: 200,
                    child: Card(
                      child: ListTile(
                        title: Text("Total Spending"),
                        subtitle: Text("MYR 17.00",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                  Container(
                    height: 96,
                    width: 200,
                    child: Card(
                      child: ListTile(
                        title: Text("Today's Spending"),
                        subtitle: Text("MYR 17.00",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
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
              SizedBox(height: 10),
              Container(
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
              SizedBox(height: 10),
              Container(
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
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}
