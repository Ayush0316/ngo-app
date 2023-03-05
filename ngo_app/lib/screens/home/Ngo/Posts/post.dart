import 'package:flutter/material.dart';

class post_ngo extends StatefulWidget {
  const post_ngo({super.key});

  @override
  State<post_ngo> createState() => _post_ngoState();
}

class _post_ngoState extends State<post_ngo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: 200,
      width: double.infinity,
      child: Text(
        "Post notifications",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto-Black',
          fontSize: 15.0,
        ),
      ),
    );
  }
}
