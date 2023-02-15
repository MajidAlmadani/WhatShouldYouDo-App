import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/account.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Account? _accountFromFireBaseUser(User user) {
    return user != null ? Account(uid: user.uid) : null;
  }

  // Sign in guest
  Future signInGuest() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _accountFromFireBaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email & password

  // register with email & password

  // sign out
}
