import "package:flutter/material.dart";

class Ngo_History extends StatefulWidget {
  const Ngo_History({super.key});

  @override
  State<Ngo_History> createState() => _Ngo_HistoryState();
}

class _Ngo_HistoryState extends State<Ngo_History> {
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
              title: Text("Ngo_History"),
              elevation: 0.0,
              backgroundColor: Colors.blue),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(),
            ),
          )));
}
