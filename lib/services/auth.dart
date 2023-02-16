import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/account.dart';

import '../main.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Account? _accountFromFireBaseUser(User user) {
    return user != null ? Account(uid: user.uid) : null;
  }

  // auth change user stream

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
  Future signIn(context, userEmail, userPassword) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
    } on FirebaseException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // register with email & password

  // sign out
}
