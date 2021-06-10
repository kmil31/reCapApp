import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recap2/landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<FirebaseAuth>(
      create: (context) => FirebaseAuth.instance,
      child: MaterialApp(
        title: 'reCap App',
        theme: ThemeData(
            primaryColor: Colors.blue,
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            )),
            home: LandingPage(),
      ),
      
      
    );
  }
}