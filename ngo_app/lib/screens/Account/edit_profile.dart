import "package:flutter/material.dart";

class profile_user extends StatefulWidget {
  const profile_user({super.key});

  @override
  State<profile_user> createState() => _profile_userState();
}

class _profile_userState extends State<profile_user> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: _key,
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: const Text("Profile"),
            elevation: 0.0,
          ),
        ),
      );
}
