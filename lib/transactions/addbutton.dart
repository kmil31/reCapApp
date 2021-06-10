import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recap2/services/userdetails.dart';
import '../services/database.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Food';
  String category = '', description = '', total = '';
  String date = DateTime.now().toString();

  DatabaseService db = new DatabaseService(uid: UserDetails().getuid());

  void successdialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Successfully added a transaction!"),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add_circle_sharp),
      iconSize: 80,
      color: Colors.grey[20],
      onPressed: () {
        AwesomeDialog(
          context: context,
          headerAnimationLoop: false,
          animType: AnimType.BOTTOMSLIDE,
          dialogType: DialogType.INFO_REVERSED,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StatefulBuilder(builder: (context, setState) {
              return Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Add a Transaction',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Category',
                      ),
                      items: <String>[
                        'Food',
                        'Bills',
                        'Subscriptions',
                        'Transport',
                        'Education',
                        'Others'
                      ].map<DropdownMenuItem<String>>((String newvalue) {
                        return DropdownMenuItem<String>(
                          value: newvalue,
                          child: Text(newvalue),
                        );
                      }).toList(),
                      validator: (newvalue) => newvalue == null
                          ? 'Please fill in the Category'
                          : null,
                      onChanged: (newvalue) async {
                        setState(() {
                          category = newvalue;
                          print(category);
                        });
                      },
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Enter a short description' : null,
                      maxLength: 15,
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Total',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) =>
                            value.isEmpty ? 'Enter the total' : null,
                        onChanged: (value) {
                          total = value;
                        }),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                print("The category" + category);
                                db.createTransaction(
                                    date, category, description, total);
                                db.minusBudget(total);
                                successdialog();
                              }
                            },
                            child: Text("Submit")),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ).show();
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var currentSelectedValue;
  final deviceTypes = ["Mac", "Windows", "Mobile"];

  Widget typeFieldWidget() {
    return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Select Device"),
                value: currentSelectedValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue;
                  });
                  print(currentSelectedValue);
                },
                items: deviceTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: typeFieldWidget(),
    ));
  }
}
