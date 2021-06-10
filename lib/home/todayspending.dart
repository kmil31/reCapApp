import 'package:flutter/material.dart';
import 'package:recap2/services/userdetails.dart';
import 'package:recap2/services/database.dart';



class TodaySpending extends StatefulWidget {
  @override
  _TodaySpendingState createState() => _TodaySpendingState();
}

class _TodaySpendingState extends State<TodaySpending> {
  DatabaseService db = DatabaseService(uid: UserDetails().getuid());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: db.getTodayExpense(),
      builder: (BuildContext context, AsyncSnapshot<int> value) {
        return Container(
          height: 96,
          width: 200,
          child: Card(
            child: ListTile(
              title: Text("Today's Spending"),
              subtitle: Text("MYR " + value.data.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  )),
            ),
          ),
        );
      },
    );
  }
}
