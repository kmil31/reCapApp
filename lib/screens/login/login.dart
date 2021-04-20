import 'package:flutter/material.dart';
import 'package:recap/services/authservice.dart';
import 'package:recap/widget/google_signinButton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFE),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 250,
              ),
              Image.asset(
                "assets/image/recap.png",
                height: 150.0,
              ),
              SizedBox(height: 20),
              Text(
                'WELCOME TO RECAP ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 150),
              SizedBox(
                height: 45,
                width: 317,
                child: GoogleSignupButtonWidget(),
              ),
              SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
