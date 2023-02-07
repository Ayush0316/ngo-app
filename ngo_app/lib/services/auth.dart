import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/modals/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Creating a CustUser based on the User.
  CustUser? _custUserFromUser(User? user) {
    return user != null ? CustUser(uid: user.uid) : null;
  }

  // auth change User Stream.
  Stream<CustUser?> get user {
    return _auth.authStateChanges().map(_custUserFromUser);
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String Email, String Password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      User? user = result.user;
      return _custUserFromUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _custUserFromUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
