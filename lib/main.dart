import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:recap/services/authservice.dart';
import 'package:recap/utils/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp();
   
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "ReCap";

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primaryColor: Colors.blue, fontFamily: 'Roboto Slab'),
      home: Wrapper(), // We call Wrapper for authentication
    );
  }
}
