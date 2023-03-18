import "package:flutter/material.dart";
import 'package:sliding_switch/sliding_switch.dart';
import 'package:getwidget/getwidget.dart';
import 'package:ngo_app/responsive.dart';

class settings_user extends StatefulWidget {
  const settings_user({super.key});

  @override
  State<settings_user> createState() => _settings_userState();
}

class _settings_userState extends State<settings_user> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _key,
        backgroundColor: Color.fromARGB(249, 255, 255, 255),
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(false),
          ),
          backgroundColor: Colors.blue,
          title: const Text("Settings"),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Container(
              height: 100,
              width: width,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Notifications\n',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto-Black',
                          color: Colors.black,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                "Turning off will disable all the\n notifications for the App",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Roboto-Black',
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      // width: Responsive.isSmallScreen(context)
                      //     ? width
                      //     : width / 10,
                      width: width / 3,
                    ),
                    GFToggle(
                      enabledThumbColor: Colors.white,
                      enabledTrackColor: Colors.blue,
                      onChanged: (val) {},
                      value: true,
                      type: GFToggleType.ios,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
