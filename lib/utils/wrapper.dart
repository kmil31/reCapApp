import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recap/screens/home/home.dart';
import 'package:recap/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

// This class returns HomePage or Login Page depending on authentication state

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provuser = Provider.of<User?>(context);

    //return either HomePage or Authentication(login and register page)
    //
    if (provuser == null) {
      return Login();
    } else {
      return HomePage();
    }
  }
}
