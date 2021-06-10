import 'package:flutter/material.dart';

//form widget
class ZakatFitrForm extends StatefulWidget {
  @override
  _ZakatFitrFormState createState() => _ZakatFitrFormState();
}

class _ZakatFitrFormState extends State<ZakatFitrForm> {
  final _formKey = GlobalKey<FormState>();
  double _zakat;
  double _rate = 7.0;

  double setZakat(String value) {
    setState(() {
      _zakat = double.tryParse(value) ?? 0.0;
    });
    return _zakat;
  }

  void _calculateZakat(double _zakat) {
    _zakat = _zakat * _rate;
    _showDialog(_zakat);
  }

  void _showDialog(double _zakat) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("You need to pay: RM $_zakat",
              textAlign: TextAlign.center),
          actions: <Widget>[
            // ignore: deprecated_member_use
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onChanged: (value) {
                setZakat(value);
              },
            ),
          ),
          Container(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                minimumSize: Size(88, 46),
                side: BorderSide(width: 1, color: Colors.black),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _calculateZakat(_zakat);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
