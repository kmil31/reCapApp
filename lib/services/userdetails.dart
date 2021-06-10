import 'package:firebase_auth/firebase_auth.dart';

class UserDetails {
  FirebaseAuth auth = FirebaseAuth.instance;

  String getUsername() {
    return auth.currentUser.displayName.toString();
  }

  String getDisplayUrl() {
    return auth.currentUser.photoURL.toString();
  }

  String getEmail() {
    return auth.currentUser.email.toString();
  }

  String getuid() {
    return auth.currentUser.uid.toString();
  }
}
