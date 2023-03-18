import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/database.dart';

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
  Future registerWithEmailAndPassword(Map<String, dynamic> data) async {
    String email = data["email"];
    String password = data["password"];
    // data.remove("email");
    data.remove("password");
    data.remove("confirm_password");
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // Create new user with uid.
      if (data["type"] == "User") {
        await DatabaseService(uid: user!.uid).updateUserData(data);
      } else {
        await DatabaseService(uid: user!.uid).updateNgoData(data);
      }

      return _custUserFromUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _custUserFromUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

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

  // change password
  Future changePassword(String new_pass) async {
    try {
      User user = _auth.currentUser!;
      await user.updatePassword(new_pass);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // reset password
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return "Email resent to reset password!!";
    } catch (e) {
      debugPrint(e.toString());
      return "User not found!!";
    }
  }
}
