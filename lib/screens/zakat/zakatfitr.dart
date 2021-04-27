import 'package:flutter/material.dart';
import 'package:recap/sharedwidgets/drawer.dart';

class ZakatFitr extends StatefulWidget {
  @override
  ZakatFitrState createState() => ZakatFitrState();
}

class ZakatFitrState extends State<ZakatFitr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5.0,
        elevation: 5.0,
        backgroundColor: Color(0xff201F23),
        title: Text('Zakat al-Fitr'),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(20),
              child: Text('Zakat al-Fitr',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              color: Colors.green[100],
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                  'Zakat al-Fitr is a zakat that must be paid by every adult who possesses food in excess of their needs, during the month of Ramadhan. The minimum amount is approximately 2.6-3kg of staple food, such as rice or wheat, or the equivalent in cash. You can pay zakat for yourself and for your family.',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text('''"This Year's Rate"
              MYR 7.00
              *price may be different according to state''',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ),
            Container(child: ZakatFitrForm()),
          ],
        ),
      ),
    );
  }
}

//form widget
class ZakatFitrForm extends StatefulWidget {
  //ZakatFitrForm({Key key, this.title}) : super(key: key);
  @override
  _ZakatFitrFormState createState() => _ZakatFitrFormState();
}

class _ZakatFitrFormState extends State<ZakatFitrForm> {
  final _formKey = GlobalKey<FormState>();
  double _zakat = 0.0;
  double _rate = 7.0;

  void _setZakat() {
    setState(() {
      _zakat = _zakat * _rate;
    });
  }

  dynamic _getZakat() {
    return _zakat;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of dependent: '),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              )),
          Container(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //display();
                }
              },
              child: Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
