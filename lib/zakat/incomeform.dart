import 'package:flutter/material.dart';

class IncomeForm extends StatefulWidget {
  @override
  _IncomeFormState createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm> {
  final _formKey = GlobalKey<FormState>();
  var _grossIncome;
  var _sideIncome;
  var _otherIncome;
  var _wives;
  var _personal = 11300.00;
  var _childabove18;
  var _childunder18;
  var _childunder5;
  var _specialneeds;
  var _suppport;
  var _epf = 0.11;
  var _totalIncome;
  var _totalDeduction;
  var _total;

  void _setGrossIncome(String grossIncome) {
    setState(() {
      _grossIncome = double.tryParse(grossIncome) ?? 0.0;
    });
  }

  void _setSideIncome(String sideIncome) {
    setState(() {
      _sideIncome = double.tryParse(sideIncome) ?? 0.0;
    });
  }

  void _setOtherIncome(String otherIncome) {
    setState(() {
      _otherIncome = double.tryParse(otherIncome) ?? 0.0;
    });
  }

  void _setWives(String wives) {
    setState(() {
      _wives = double.tryParse(wives) ?? 0.0;
      _wives = _wives * 5000; //rate for Selangor
    });
  }

  void _setchildabove18(String childabove18) {
    setState(() {
      _childabove18 = double.tryParse(childabove18) ?? 0.0;
      _childabove18 = _childabove18 * 6850; //rate for Selangor
    });
  }

  void _setchildunder18(String childunder18) {
    setState(() {
      _childunder18 = double.tryParse(childunder18) ?? 0.0;
      _childunder18 = _childunder18 * 7050; //rate for Selangor
    });
  }

  void _setchildunder5(String childunder5) {
    setState(() {
      _childunder5 = double.tryParse(childunder5) ?? 0.0;
      _childunder5 = _childunder5 * 1450; //rate for Selangor
    });
  }

  void _setspecialneeds(String specialneeds) {
    setState(() {
      _specialneeds = double.tryParse(specialneeds) ?? 0.0;
      _specialneeds = _specialneeds * 2400; //rate for Selangor
    });
  }

  void _setsupport(String suppport) {
    setState(() {
      _suppport = double.tryParse(suppport) ?? 0.0;
      _suppport = _suppport * 2400; //rate for Selangor
    });
  }

  void _calcTotal() {
    setState(() {
      _totalIncome = _grossIncome + _sideIncome + _otherIncome;
      _epf = _epf * _grossIncome;
      _totalDeduction = _personal +
          _epf +
          _wives +
          _childabove18 +
          _childunder18 +
          _childunder5 +
          _specialneeds +
          _suppport;
      _total = _totalIncome - _totalDeduction;

      _showDialog('''The final amount of 
      Income Zakat: \n''' +
          "\nTotal Income: RM " +
          _totalIncome.toStringAsFixed(2) +
          "\n\nTotal Deduction: RM " +
          _totalDeduction.toStringAsFixed(2) +
          "\n\nTotal Income Zakat: RM " +
          _total.toStringAsFixed(2));
    });
  }

  void _showDialog(String status) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: new Text("Income Zakat\n",
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
            margin: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Text("Income",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
                  labelText: 'Annual Gross Income (RM)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onChanged: (grossIncome) {
                _setGrossIncome(grossIncome);
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
                  labelText: 'Freelance/ Side Income (RM)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onChanged: (sideIncome) {
                _setSideIncome(sideIncome);
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
                  labelText: 'Other Income (MYR)'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onChanged: (otherIncome) {
                _setOtherIncome(otherIncome);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Text("Deductions",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 23),
            child: Text('Personal Expenses             RM 11,300.00',
                style: TextStyle(fontSize: 15, color: Colors.black)),
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.symmetric(horizontal: 23),
            child: Text('EPF Contribution                   11%',
                style: TextStyle(fontSize: 15, color: Colors.black)),
          ),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text('Wives',
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                    Spacer(),
                    new Flexible(
                        child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                )),
                                labelText: 'person'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            onChanged: (wives) {
                              _setWives(wives);
                            }))
                  ])),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Child older than 18 years old (still studying)',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 45),
                    Flexible(
                        child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                )),
                                labelText: 'person'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            onChanged: (childabove18) {
                              _setchildabove18(childabove18);
                            }))
                  ])),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Child younger than 18 years old',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 45),
                    Flexible(
                        child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                )),
                                labelText: 'person'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            onChanged: (childunder18) {
                              _setchildunder18(childunder18);
                            }))
                  ])),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Child younger than 5 years old',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 45),
                    Flexible(
                        child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                )),
                                labelText: 'person'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            onChanged: (childunder5) {
                              _setchildunder5(childunder5);
                            }))
                  ])),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Special needs child',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 45),
                    Flexible(
                        child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                )),
                                labelText: 'person'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            onChanged: (specialneeds) {
                              _setspecialneeds(specialneeds);
                            }))
                  ])),
          Padding(padding: EdgeInsets.only(top: 25.0)),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 23),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Text(
                        'Supporting person with chronic illness',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 45),
                    Flexible(
                        child: TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                )),
                                labelText: 'person'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            onChanged: (support) {
                              _setsupport(support);
                            }))
                  ])),
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
                    _calcTotal();
                  }
                },
                child: const Text('Calculate'),
              )),
        ],
      ),
    );
  }
}
