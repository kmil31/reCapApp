import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recap2/services/database.dart';
import 'package:recap2/services/userdetails.dart';

class BudgetWidget extends StatefulWidget {
  @override
  _BudgetWidgetState createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  DatabaseService db = DatabaseService(uid: UserDetails().getuid());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(UserDetails().getuid())
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> docsnapshot) {
          try {
            if (!docsnapshot.hasData || !docsnapshot.data.exists) {
              db.createUser();
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (docsnapshot.data.get('budget') == null) {}
          } catch (e) {
            db.setDefaultBudget();
            print("error");
          }

          if (int.parse(docsnapshot.data['budget']) < 0) {
            Fluttertoast.showToast(
                msg: "You're way over budget! Please set a new budget!");
          }
          return Text(
            'RM ' + docsnapshot.data['budget'].toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
            ),
          );
        });
  }
}
