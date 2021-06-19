import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NisabForm extends StatefulWidget {
  @override
  _NisabFormState createState() => _NisabFormState();
}

class _NisabFormState extends State<NisabForm> {
  final _formKey = GlobalKey<FormState>();
  var _gold = 0.0;
  var _silver = 0.0;
  var _asset;

  void _setGold(String gold) {
    setState(() {
      _gold = double.tryParse(gold) ?? 0;
      _gold = _gold * 0.085763293310463; // convert to tola
    });
  }

  void _setSilver(String silver) {
    setState(() {
      _silver = double.tryParse(silver) ?? 0;
      _silver = _silver * 0.085763293310463; //convert to tola
    });
  }

  void _setCash(String cash) {
    setState(() {
      _asset = double.tryParse(cash) ?? 0.0;
    });
  }

  void _calcNisab() {
    if (_gold >= 7.5 || _silver >= 52.5 || _asset >= (7.5 * 2802)) {
      _showDialog("You are eligible to pay zakat.");
    } else
      _showDialog('You do not have to pay zakat.');

    setState(() {
      _gold = 0.0;
      _silver = 0.0;
      _asset = 0.0;
    });
  }

  void _showDialog(String status) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text("Based on your assets, we have calculated: \n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              content: new Text(status,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
              actions: <Widget>[
                // ignore: deprecated_member_use
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _formKey.currentState.reset();
                  },
                )
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 380,
            child: TextFormField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
                  labelText: 'How much gold do you own? (g) '),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onChanged: (gold) {
                _setGold(gold);
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              width: 380,
              child: TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    )),
                    labelText: 'How much silver do you own? (g) '),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
                onChanged: (silver) {
                  _setSilver(silver);
                },
              )),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              width: 380,
              child: TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    )),
                    labelText: 'How much cash do you own?'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
                onChanged: (cash) {
                  _setCash(cash);
                },
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _calcNisab();
                  }
                },
                child: const Text('Submit'),
              )),
        ],
      ),
    );
  }
}
