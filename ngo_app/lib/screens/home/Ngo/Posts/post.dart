import 'package:flutter/material.dart';
import 'package:ngo_app/screens/home/Ngo/Posts/req_volunteers.dart';
import 'package:ngo_app/screens/home/Ngo/Posts/req_items.dart';
import 'package:ngo_app/responsive.dart';

class post_ngo extends StatefulWidget {
  const post_ngo({super.key});

  @override
  State<post_ngo> createState() => _post_ngoState();
}

class _post_ngoState extends State<post_ngo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      // height: Responsive.isSmallScreen(context) ? height / 4 : height,
      width: double.infinity,
      child: Column(
        children: [
          ButtonTheme(
            height: 20,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const req_donations()));
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Post regarding requirement of Donations\n',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto-Black',
                      color: Colors.white,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text:
                            "more text just for the description of this option \n like what actually this option does",
                        style: TextStyle(
                            color: Colors.black,
                            height: 1.2,
                            fontSize: 12.0,
                            fontFamily: 'Roboto-Black',
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0.0,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            height: 20,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const req_volunteers()));
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: TextSpan(
                    text: 'Post regarding requirement of Volunteers \n',
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto-Black',
                      color: Colors.white,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text:
                            "more text just for the description of this option \n like what actually this option does",
                        style: TextStyle(
                            color: Colors.black,
                            height: 1.2,
                            fontSize: 12.0,
                            fontFamily: 'Roboto-Black',
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 0.0,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
