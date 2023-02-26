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
      height: 150,
      width: double.infinity,
      child: Text(
        "this section will contain some information about the app and its past woks done (in the Text section )\nLorem ipsum dolor sit amet. Est error voluptatem eum ratione voluptatum eum eveniet inventore ut mollitia mollitia est reiciendis magni et consectetur \nrecusandae. Est commodi laborum ea laudantium eius ut quas doloremque sit accusamus unde qui ",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto-Black',
          fontSize: 15.0,
        ),
      ),
    );
  }
}
