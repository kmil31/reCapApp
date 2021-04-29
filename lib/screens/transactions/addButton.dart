import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recap/screens/transactions/database.dart';
import 'package:recap/services/userdetails.dart';

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final _formKey = GlobalKey<FormState>();
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
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                title: Text('Add A Transaction'),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Category',
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Enter an ID' : null,
                          onChanged: (value) {
                            category = value;
                          },
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(15),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Description',
                          ),
                          validator: (value) => value!.isEmpty
                              ? 'Enter a short description'
                              : null,
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
                                value!.isEmpty ? 'Enter the total' : null,
                            onChanged: (value) {
                              total = value;
                            }),
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          db.createTransaction(
                              date, category, description, total);
                          successdialog();
                        }
                        // your code
                      })
                ],
              );
            });
      },
    );
  }
}
