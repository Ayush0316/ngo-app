import "package:flutter/material.dart";
class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  @override
Widget build(BuildContext context) => GestureDetector(
      //adding a search bar
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
              leading: BackButton(
                onPressed: () => Navigator.of(context).pop(false),
              ),
              title: Text("History"),
              elevation: 0.0,
              backgroundColor: Colors.blue),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(),
            ),
          )));
}