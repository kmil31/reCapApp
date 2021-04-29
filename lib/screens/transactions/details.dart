import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recap/screens/transactions/database.dart';
import 'package:recap/services/userdetails.dart';
import 'package:recap/sharedwidgets/constants.dart';

// ignore: must_be_immutable
class ExpenseDetails extends StatelessWidget {
  String category = '', date = '', description = '', total = '';

  ExpenseDetails(this.category, this.date, this.description, this.total);
  DatabaseService db = DatabaseService(uid: UserDetails().getuid());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Card(
              elevation: 10,
              shadowColor: Colors.black,
              color: Color(0xFFFAFAFA),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 1.8,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        category + ' - ' + description,
                        style: hometextstyling,
                      ),
                      subtitle: Text("Transaction Date: " +
                          DateFormat.yMMMd('en_US')
                              .format(DateTime.parse(date))),
                    ),
                    SizedBox(
                      height: 180,
                    ),
                    Text(
                      "Total : " + "RM" + total,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Category: " + category),
                    Text("Description: " + description)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  try {
                    db.deleteTransaction(date);
                    print("Delete Successful");
                    Navigator.pop(context);
                  } catch (e) {
                    print("Failure" + e.toString());
                  }
                },
                child: Text("Delete transaction"))
          ],
        ),
      ),
    );
  }
}
