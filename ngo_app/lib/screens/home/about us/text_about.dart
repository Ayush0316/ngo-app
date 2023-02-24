import 'package:flutter/material.dart';

class text_about extends StatefulWidget {
  const text_about({super.key});

  @override
  State<text_about> createState() => _text_aboutState();
}

class _text_aboutState extends State<text_about> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(
                color: Color.fromARGB(255, 162, 158, 158),
                height: 20,
                thickness: 1,
              )),
        ),
        Text(
          'About Us',
          style: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto-Black',
            color: Color.fromARGB(255, 98, 96, 96),
            fontSize: 15.0,
          ),
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Divider(
                color: Color.fromARGB(255, 162, 158, 158),
                height: 20,
                thickness: 1,
              )),
        ),
      ]),
    );
  }
}
