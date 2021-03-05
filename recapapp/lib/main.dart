import 'package:recapapp/zakat/zakatmain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "ReCap";

    return MaterialApp(
        title: appTitle,
        theme: ThemeData(primaryColor: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => Zakat(),
        });
  }
}
