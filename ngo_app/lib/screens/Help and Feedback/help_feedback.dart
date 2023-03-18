import "package:flutter/material.dart";

class help_feedback extends StatefulWidget {
  const help_feedback({super.key});

  @override
  State<help_feedback> createState() => _help_feedbackState();
}

class _help_feedbackState extends State<help_feedback> {
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
              title: Text("Help And Feedback"),
              elevation: 0.0,
              backgroundColor: Colors.blue),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(),
            ),
          )));
}
