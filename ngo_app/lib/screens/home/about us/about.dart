import 'package:flutter/material.dart';

class aboutUS extends StatefulWidget {
  const aboutUS({super.key});

  @override
  State<aboutUS> createState() => _aboutUSState();
}

class _aboutUSState extends State<aboutUS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: 400,
      width: double.infinity,
      child: Text("about us and our previous works"),
    );
  }
}
