import 'package:flutter/material.dart';

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
