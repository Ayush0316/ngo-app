import 'package:flutter/material.dart';

class title_aboutUs extends StatefulWidget {
  const title_aboutUs({super.key});

  @override
  State<title_aboutUs> createState() => _title_aboutUsState();
}

class _title_aboutUsState extends State<title_aboutUs> {
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
