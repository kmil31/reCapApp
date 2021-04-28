import 'package:flutter/material.dart';

class NisabForm extends StatefulWidget {
  @override
  _NisabFormState createState() => _NisabFormState();
}

class _NisabFormState extends State<NisabForm> {
  final _formKey = GlobalKey<FormState>();
  var _gold;
  var _silver;
  //double _cash;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                if (value!.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
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
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
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
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
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
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Submit'),
              )),
        ],
      ),
    );
  }
}
