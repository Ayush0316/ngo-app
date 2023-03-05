import 'package:flutter/material.dart';

class text_recommend extends StatefulWidget {
  const text_recommend({super.key});

  @override
  State<text_recommend> createState() => _text_recommendState();
}

class _text_recommendState extends State<text_recommend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(children: <Widget>[
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 5.0),
          ),
        ),
        Text(
          'Recommended Communities',
          style: TextStyle(
            letterSpacing: 1.2,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto-Black',
            color: Color.fromARGB(255, 98, 96, 96),
            fontSize: 18.0,
          ),
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 5.0, right: 10.0),
          ),
        ),
      ]),
    );
  }
}
