import 'package:flutter/material.dart';

class end_text extends StatefulWidget {
  const end_text({super.key});

  @override
  State<end_text> createState() => _end_textState();
}

class _end_textState extends State<end_text> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(15, 210, 114, 18), //this color should be same as the entire home screens background clolor
      height: 100,
      width: double.infinity,
      child: Text("ending text of the home screen may be a quote "),
    );
  }
}
