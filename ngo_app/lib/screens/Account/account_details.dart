import "package:flutter/material.dart";

class acc_details extends StatefulWidget {
  const acc_details({super.key});

  @override
  State<acc_details> createState() => _acc_detailsState();
}

class _acc_detailsState extends State<acc_details> {
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
            title: const Text("Account Details"),
            elevation: 0.0,
          ),
          //   body: SafeArea(
        ),
      );
}
