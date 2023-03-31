import 'package:flutter/material.dart';
import 'package:ngo_app/services/auth.dart';

class ShowError extends StatelessWidget {
  const ShowError({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.blue,
          actions: [
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
                while (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                await _auth.signOut();
              },
            )
          ],
        ),
        body: SafeArea(
            child: Center(
          child: CircularProgressIndicator(),
        )));
  }
}
