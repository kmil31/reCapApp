import 'package:flutter/material.dart';
import 'package:recap/sharedwidgets/drawer.dart';
//import 'package:editable/editable.dart';

class IncomeZakat2 extends StatefulWidget {
  @override
  IncomeZakat2State createState() => IncomeZakat2State();
}

class IncomeZakat2State extends State<IncomeZakat2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Income Zakat",
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
        child: ListView(
          children: <Widget>[
            Text("A: HOUSEHOLD KIFAYAH LIMIT",
                style: TextStyle(fontSize: 15, color: Colors.black)),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('NO',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('BILL DETAILS',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('RM',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text(' ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('B1.1')),
                  DataCell(Text('Head of Family')),
                  DataCell(Text('MYR')),
                  DataCell(Text(' ')),
                ]),
                DataRow(cells: [
                  DataCell(Text('B1.2')),
                  DataCell(
                      Text('Working Adult (> 18 years) (RM4,848 /person)')),
                  DataCell(Text('MYR')),
                  DataCell(Text(' ')),
                ]),
                DataRow(cells: [
                  DataCell(Text('B1.3')),
                  DataCell(
                      Text('Non-Working Adult (>18 years) (RM2,172/person)')),
                  DataCell(Text('MYR')),
                  DataCell(Text(' ')),
                ]),
                DataRow(cells: [
                  DataCell(Text('B1.4')),
                  DataCell(Text('IPT Student Dependents (RM7,104/person)')),
                  DataCell(Text('MYR')),
                  DataCell(Text(' ')),
                ]),
                DataRow(cells: [
                  DataCell(Text('B1.5')),
                  DataCell(Text('Dependents aged 7-17 years (RM4,008/person)')),
                  DataCell(Text('MYR')),
                  DataCell(Text(' ')),
                ]),
                DataRow(cells: [
                  DataCell(Text('B1.6')),
                  DataCell(Text('Dependents 6 years & under (RM1,740/person)')),
                  DataCell(Text('MYR')),
                  DataCell(Text(' ')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
