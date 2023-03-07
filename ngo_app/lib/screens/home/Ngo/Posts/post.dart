import 'package:flutter/material.dart';

class post_ngo extends StatefulWidget {
  const post_ngo({super.key});

  @override
  State<post_ngo> createState() => _post_ngoState();
}

class _post_ngoState extends State<post_ngo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 185,
      width: double.infinity,
      child: Column(
        children: [
          ButtonTheme(
            height: 20,
            child: ElevatedButton(
              onPressed: () async {},
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  softWrap: false,
                  "Post for requirement of Stuff\n",
                  style: TextStyle(
                      letterSpacing: 0.3,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0.0,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.only(top: 15, left: 10, bottom: 5),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ButtonTheme(
            height: 20,
            child: ElevatedButton(
              onPressed: () async {},
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  softWrap: false,
                  "Post for requirement of Volunteers\n",
                  style: TextStyle(
                      letterSpacing: 0.3,
                      fontSize: 18,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0.0,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.only(top: 15, left: 10, bottom: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
