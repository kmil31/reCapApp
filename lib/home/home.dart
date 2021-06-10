import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recap2/home/todayspending.dart';
import 'package:recap2/home/totalspending.dart';
import 'package:recap2/services/database.dart';
import 'package:recap2/services/userdetails.dart';
import 'package:recap2/transactions/translist.dart';
import 'package:recap2/zakat/zakatmain.dart';
import 'package:simple_animations/simple_animations.dart';
import '../navdrawer.dart';
import 'budget.dart';
import 'package:supercharged/supercharged.dart';

import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserDetails userDetails = UserDetails();
  final _formKey = GlobalKey<FormState>();
  DatabaseService db = DatabaseService(uid: UserDetails().getuid());

  void adddialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String fbudget = '';
          return AlertDialog(
              title: Text("Set a New Budget"),
              content: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Total',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) =>
                            value.isEmpty ? 'Enter the total' : null,
                        onChanged: (value) {
                          fbudget = value;
                        }),
                    TextButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            db.setBudget(fbudget);

                            print("Budget set success!");
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Submit")),
                  ],
                ),
              ));
        });
  }

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
                    child: Text('Remaining Budget',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                SizedBox(height: 10),
                BudgetWidget(),
                SizedBox(height: 30),
                InkWell(
                    onTap: () async {
                      adddialog();
                    },
                    child: BudgetButton()),
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
                          pageBuilder: (c, a1, a2) => WillPopScope(
                              onWillPop: () async => false,
                              child: TransactionList()),
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
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
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
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                )),
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
                            'Analytics',
                            style: GoogleFonts.getFont('Poppins',
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
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
}

class BudgetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
        tween: 50.0.tweenTo(200.0),
        duration: 1.seconds,
        delay: 0.5.seconds,
        curve: Curves.easeOut,
        builder: (context, child, value) {
          return Container(
            width: value,
            height: 40.0,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
              color: const Color.fromRGBO(247, 64, 106, 1.0),
              borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
            ),
            child: PlayAnimation(
              delay: 1.5.seconds,
              duration: 0.5.seconds,
              tween: 0.0.tweenTo(1.0),
              builder: (context, child, value) {
                return Text(
                  "Set your Budget!",
                  style: TextStyle(
                    color: Colors.white.withOpacity(value),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                );
              },
            ),
          );
        });
  }
}
