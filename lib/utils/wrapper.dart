import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recap/provider/google_signin.dart';

import 'package:recap/screens/home/home.dart';
import 'package:recap/screens/login/login.dart';
import 'package:recap/widget/background_painter.dart';

// This class returns HomePage or Login Page depending on authentication state

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);
            if (provider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return Login();
            }
          },
        ),
      ),
    );

    //return either HomePage or Authentication(login and register page)
  }

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          Center(child: CircularProgressIndicator()),
        ],
      );
}
