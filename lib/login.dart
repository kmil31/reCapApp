import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recap2/services/authlogic.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

DateTime currentBackPressTime;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authlogic = new AuthLogic();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press back again to exit!');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
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
                  'ReCAP APP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto Slab',
                  ),
                ),
                SizedBox(height: 150),
                SizedBox(
                  height: 15,
                  width: 300,
                ),
                InkWell(
                    onTap: () {
                      authlogic.signInWithGoogle(context);
                    },
                    child: SingButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
        tween: 50.0.tweenTo(320.0),
        duration: 1.seconds,
        delay: 0.5.seconds,
        curve: Curves.easeOut,
        builder: (context, child, value) {
          return Container(
            width: value,
            height: 60.0,
            alignment: FractionalOffset.center,
            decoration: new BoxDecoration(
              color: const Color.fromRGBO(247, 64, 106, 1.0),
              borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
            ),
            child: PlayAnimation(
              delay: 1.5.seconds,
              duration: 0.5.seconds,
              tween: 0.0.tweenTo(1.0),
              builder: (context, child, value) {
                return Text(
                  "Sign In With Google",
                  style: TextStyle(
                    color: Colors.white.withOpacity(value),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                );
              },
            ),
          );
        });
  }
}
