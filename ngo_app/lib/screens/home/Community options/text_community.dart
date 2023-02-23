import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class text_community extends StatefulWidget {
  const text_community({super.key});

  @override
  State<text_community> createState() => _text_communityState();
}

class _text_communityState extends State<text_community> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(children: <Widget>[
        Expanded(
          child: new Container(
              margin: const EdgeInsets.only(left: 10.0, right: 5.0),
              child: Divider(
                color: Color.fromARGB(255, 162, 158, 158),
                height: 20,
                thickness: 1,
              )),
        ),
        Text(
          'Explore Communities',
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
              margin: const EdgeInsets.only(left: 5.0, right: 10.0),
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
