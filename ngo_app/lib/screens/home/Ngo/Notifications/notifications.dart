import 'package:flutter/material.dart';

class notification_ngo extends StatefulWidget {
  const notification_ngo({super.key});

  @override
  State<notification_ngo> createState() => _notification_ngoState();
}

class _notification_ngoState extends State<notification_ngo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: 300,
      width: double.infinity,
      child: Text(
        "some of the recent notifications \n like a user just contacted the ngo... ",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto-Black',
          fontSize: 15.0,
        ),
      ),
    );
  }
}
