import 'package:flutter/material.dart';
import 'package:ngo_app/screens/authenticate/login_screen.dart';
import 'package:ngo_app/screens/authenticate/register_ngo.dart';
import 'package:ngo_app/screens/authenticate/register_user.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  int showSignIn = 1;
  void toggleView(num) {
    setState(() {
      showSignIn = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn == 1) {
      return LoginScreen(toggleView);
    } else if (showSignIn == 2) {
      return RegisterNgo(toggleView);
    } else {
      return RegisterUser(toggleView);
    }
  }
}
