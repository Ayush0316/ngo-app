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
      height: 100,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "There could be no definition of a successful life that does not include service to others. \n -President George H.W Bush",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 122, 114, 114),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto-Black',
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
