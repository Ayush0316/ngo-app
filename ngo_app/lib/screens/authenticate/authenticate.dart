import 'package:flutter/material.dart';
import 'package:ngo_app/screens/authenticate/register.dart';
import 'package:ngo_app/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // Toggling between sigin and registering route.
  bool showSignIn = false;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView);
    } else {
      return Register(
        toggleView,
      );
    }
  }
}
