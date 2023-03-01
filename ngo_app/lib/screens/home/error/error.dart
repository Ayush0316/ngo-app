import 'package:flutter/material.dart';
import 'package:ngo_app/services/auth.dart';

class ShowError extends StatelessWidget {
  const ShowError({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Text("Error screen for undefined type"),
          TextButton(
            child: Row(
              children: [
                Icon(Icons.person),
                Text(
                  "LogOut",
                  style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto-Black',
                  ),
                ),
              ],
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    ));
  }
}
