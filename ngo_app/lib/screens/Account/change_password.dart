import "package:flutter/material.dart";

class edit_password extends StatefulWidget {
  const edit_password({super.key});

  @override
  State<edit_password> createState() => _edit_passwordState();
}

class _edit_passwordState extends State<edit_password> {
  @override
    Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: const Text("Password"),
            elevation: 0.0,
          ),
          
        ),
      );
  }