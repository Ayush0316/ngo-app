import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
//three variables of type widget
  final Widget largeScreen;
  final Widget smallScreen;
  final Widget mediumScreen;
  //constructor of the class
  const Responsive(
      {Key? key,
      required this.mediumScreen,
      required this.smallScreen,
      required this.largeScreen})
      : super(key: key);
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return largeScreen;
      } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}