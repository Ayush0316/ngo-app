import "package:flutter/material.dart";

class manage_address extends StatefulWidget {
  const manage_address({super.key});

  @override
  State<manage_address> createState() => _manage_addressState();
}

class _manage_addressState extends State<manage_address> {
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
            title: const Text("Manage Address"),
            elevation: 0.0,
          ),
          
        ),
      );
}
