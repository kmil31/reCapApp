import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthLogic {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> signInWithGoogle(BuildContext context) async {
    User user;
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        try {
          final firebaseAuth =
              Provider.of<FirebaseAuth>(context, listen: false);
          final UserCredential userCredential =
              await firebaseAuth.signInWithCredential(credential);
          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // handle the error here
          } else if (e.code == 'invalid-credential') {
            // handle the error here
          }
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print("Shit Nigga");
    }
    return user;
  }

  Future signOut(context) async {
    try {
      final firebaseAuth = Provider.of<FirebaseAuth>(context, listen: false);
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
