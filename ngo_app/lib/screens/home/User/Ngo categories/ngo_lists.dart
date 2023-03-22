import "package:flutter/material.dart";
import 'package:ngo_app/responsive.dart';

class ngo_list extends StatelessWidget {
  final List<String> textList;
  const ngo_list({super.key, required this.textList});

  @override
  Widget build(BuildContext context) {
// double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      //add search bar
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            toolbarHeight:
                Responsive.isSmallScreen(context) ? height / 6 : height,
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: Text(
              // name,
              textList[0],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto-Black',
              ),
            ),
            bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0, left: 20, right: 20, bottom: 10),
                  child: Text(textList[1]),
                ),
                preferredSize: Size.zero),
            elevation: 0.0,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //this will contain the entire list of the ngos in this rerspective section
                    ],
                  )))),
    );
  }
}
