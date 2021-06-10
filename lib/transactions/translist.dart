import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recap2/navdrawer.dart';
import 'package:recap2/services/userdetails.dart';
import 'package:recap2/transactions/addbutton.dart';
import 'package:recap2/transactions/details.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final transImage = Container(
    margin: EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: Image(
      image: AssetImage("assets/image/minimoon2.jpg"),
      height: 92.0,
      width: 92.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');

    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);
    final regularTextStyle = baseTextStyle.copyWith(
        color: Color(0xffb6b2df), fontSize: 9.0, fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 18.0);

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
                      .orderBy("date", descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children: snapshot.data.docs.map(
                        (document) {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: PlayAnimation<double>(
                                tween: 0.0.tweenTo(100.0),
                                duration: 1.seconds,
                                curve: Curves.easeOut,
                                builder: (context, child, value) {
                                  return InkWell(
                                    onTap: () {
                                      Route route = MaterialPageRoute(
                                          builder: (context) => ExpenseDetails(
                                              document['category'],
                                              document['date'],
                                              document['description'],
                                              document['total']));

                                      Navigator.push(context, route);
                                    },
                                    child: Container(
                                      height: 100,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 24.0,
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                            height: value,
                                            margin: EdgeInsets.only(left: 46.0),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF333366),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 10.0,
                                                  offset: new Offset(0.0, 10.0),
                                                ),
                                              ],
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  76.0, 16.0, 16.0, 16.0),
                                              constraints:
                                                  BoxConstraints.expand(),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    SizedBox(height: 4.0),
                                                    Text(
                                                      document['category'] +
                                                          ' - ' +
                                                          document[
                                                              'description'],
                                                      style: headerTextStyle,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    Text(
                                                      'RM ' + document['total'],
                                                      style: subHeaderTextStyle,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          transImage,
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ));
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
