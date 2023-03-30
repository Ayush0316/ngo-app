import 'package:flutter/material.dart';

class text_aboutUS extends StatefulWidget {
  const text_aboutUS({super.key});

  @override
  State<text_aboutUS> createState() => _text_aboutUSState();
}

class _text_aboutUSState extends State<text_aboutUS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: 350,
      width: double.infinity,
      child: Text(
        "Careezy is a platform that aims to simplify volunteering and make it a hassle-free process. The organization believes that individuals who wish to help should not be burdened by excessive paperwork, permissions, or payments. Instead, volunteering should be rooted in trust and the desire to make a positive difference in communities.\nWith our app, you can register once and access countless volunteering opportunities without the hassle of sorting through emails, phone calls, and forms. Our mission is to bridge the gap between volunteers and organizations, allowing everyone to work together towards a better future.\nAt Careezy, we prioritize creating connections, building relationships, and fostering a sense of community. We're committed to breaking down barriers and making it easy for people to give their time and talents to help others.",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto-Black',
          fontSize: 15.0,
        ),
      ),
    );
  }
}
