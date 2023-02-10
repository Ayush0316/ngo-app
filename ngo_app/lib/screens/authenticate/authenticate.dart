import 'package:flutter/material.dart';
import 'package:ngo_app/screens/authenticate/login_screen.dart';
import 'package:ngo_app/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // Toggling between sigin and registering route.
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return LoginScreen(toggleView);
    } else {
      return Register(
        toggleView,
      );
    }
  }
}
