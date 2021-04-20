import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



// this class handles all the sign in methods
//
final AuthService authService = AuthService();

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(); //initialise instance
 

  // FirebaseUser.

  //Sign in  Google
  Future<void> signInGoogle() async {
    try {
      _googleSignIn.signIn();
    } catch (e) {
      print(e);
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
