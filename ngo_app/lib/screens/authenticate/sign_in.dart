import 'package:flutter/material.dart';
import 'package:ngo_app/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: const Text("Sign in"),
        ),
        body: Container(
          child: ElevatedButton(
            child: const Text("sign in anon"),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result != null) {
                print("User signin successfull");
                print(result.uid);
              } else {
                print("Error signing in.");
              }
            },
          ),
        ));
  }
}
