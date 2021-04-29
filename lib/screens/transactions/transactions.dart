import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recap/screens/transactions/addButton.dart';
import 'package:recap/screens/transactions/details.dart';
import 'package:recap/services/userdetails.dart';
import 'package:recap/sharedwidgets/drawer.dart';


class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Transactions",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          titleSpacing: 5.0,
          elevation: 5.0,
          backgroundColor: Colors.white,
        ),
        drawer: DrawerMenu(),
        body: Column(
          children: [
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(UserDetails().getuid())
                      .collection('expenses')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children: snapshot.data!.docs.map(
                        (document) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: InkWell(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => ExpenseDetails(
                                          document['category'],
                                          document['date'],
                                          document['description'],
                                          document['total']));

                                  Navigator.push(context, route);
                                },
                                child: ListTile(
                                  tileColor: Colors.amber,
                                  leading: FlutterLogo(size: 72.0),
                                  title: Text(document['category'] +
                                      ' - ' +
                                      document['description']),
                                  subtitle: Text('RM ' + document['total']),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  }),
            ),
            Align(alignment: Alignment.bottomRight, child: AddButton()),
          ],
        ));
  }
}
