import 'package:flutter/material.dart';

class divider_line extends StatefulWidget {
  const divider_line({super.key});

  @override
  State<divider_line> createState() => _divider_lineState();
}

class _divider_lineState extends State<divider_line> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (Row(
        children: <Widget>[
          // ...
          Expanded(
            child: Column(
              children: <Widget>[
                Divider(
                  color: Color.fromARGB(255, 162, 158, 158),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
