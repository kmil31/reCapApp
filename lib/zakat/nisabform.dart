import 'package:flutter/material.dart';

class NisabForm extends StatefulWidget {
  @override
  _NisabFormState createState() => _NisabFormState();
}

class _NisabFormState extends State<NisabForm> {
  final _formKey = GlobalKey<FormState>();
  var _gold;
  var _silver;
  var _totalassets;
  var _total;
  var _cash;

  void _setGold(String gold) {
    setState(() {
      _gold = double.tryParse(gold) ?? 0.0;
    });
  }

  void _setSilver(String silver) {
    setState(() {
      _silver = double.tryParse(silver) ?? 0.0;
    });
  }

  void _setCash(String cash) {
    setState(() {
      _cash = double.tryParse(cash) ?? 0.0;
    });
  }

  void _calcNisab() {
    setState(() {
      _totalassets = _cash * 0.025; //2.5% of user's assets
      _gold = _gold * 2802; // 1 tola gold = RM2802
      _silver = _silver * 42; //1 tola silver = RM42
      _total = _gold + _silver;
    });

    if (_total > _cash || _total == _cash) {
      _showDialog(
          '''You are eligible to pay nisab.
      The amount you need to pay is: RM $_totalassets''');
    } else
      _showDialog('You do not have to pay nisab.');
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
                  textAlign: TextAlign.center),
              actions: <Widget>[
                // ignore: deprecated_member_use
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
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
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
                  labelText: 'How much gold do you own? (g) '),
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    )),
                    labelText: 'How much silver do you own? (g) '),
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
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    )),
                    labelText: 'How much cash do you own?'),
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
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: Size(88, 46),
                  side: BorderSide(width: 1, color: Colors.black),
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
