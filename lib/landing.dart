import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recap2/login.dart';
import 'home/home.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseAuth = Provider.of<FirebaseAuth>(context);
    return StreamBuilder<User>(
      stream: firebaseAuth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return LoginPage();
          }
          return WillPopScope(onWillPop: () async => false, child: HomePage());
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
