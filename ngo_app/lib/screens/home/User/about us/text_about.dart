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
      height: 400,
      width: double.infinity,
      child: Text(
        "Welcome to Careezy, where volunteering is made simple, streamlined, and hassle-free.\nWe believe that those who want to help should not be hindered by needless paperwork, permissions, or payments. Instead, volunteering should be grounded in trust and a desire to make a positive impact in our communities.\nWith our app, you can register once and open the doors to a world of volunteering opportunities. No longer will you have to sift through endless emails, phone calls, and forms just to find a way to give back. We're here to bridge the gap between volunteers and organizations, so everyone can work together towards a better future.\nOur focus is on creating connections, building relationships, and fostering a sense of community. We understand that when people come together with a shared goal, anything is possible. That's why we're dedicated to removing the barriers that prevent people from giving their time and talents",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto-Black',
          fontSize: 15.0,
        ),
      ),
    );
  }
}
