import "package:flutter/material.dart";

class req_volunteers extends StatefulWidget {
  const req_volunteers({super.key});

  @override
  State<req_volunteers> createState() => _req_volunteersState();
}

class _req_volunteersState extends State<req_volunteers> {
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
            title: const Text("Volunteers Required"),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
              child: Container(
                height: 100,
              ),
            ),
          ),
        ),
      );
}
