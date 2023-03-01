import 'package:flutter/material.dart';
import 'package:ngo_app/services/auth.dart';

class NgoHome extends StatefulWidget {
  const NgoHome({super.key});

  @override
  State<NgoHome> createState() => _NgoHomeState();
}

class _NgoHomeState extends State<NgoHome> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
        body: Column(
      children: [
        const Text("Home screen for ngos."),
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
    ));
  }
}
