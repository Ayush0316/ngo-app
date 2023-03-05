import "package:flutter/material.dart";

class settings_user extends StatefulWidget {
  const settings_user({super.key});

  @override
  State<settings_user> createState() => _settings_userState();
}

class _settings_userState extends State<settings_user> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: _key,
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue,
            title: const Text("Settings"),
            elevation: 0.0,
          ),
        ),
      );
}
