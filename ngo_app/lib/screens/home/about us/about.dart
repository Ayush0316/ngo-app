import 'package:flutter/material.dart';
import 'package:ngo_app/screens/home/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class aboutUS extends StatefulWidget {
  const aboutUS({super.key});

  @override
  State<aboutUS> createState() => _aboutUSState();
}

class _aboutUSState extends State<aboutUS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CarouselSlider(
          options: CarouselOptions(
            pageSnapping: false,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 700),
            viewportFraction: 1,
            padEnds: false,
          ),
          items: [
            InkWell(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: Colors.black87,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  image: DecorationImage(
                    image: AssetImage(""),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    opacity: 1.8,
                    isAntiAlias: true,
                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: Colors.black87,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  image: DecorationImage(
                    image: AssetImage(""),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    opacity: 1.8,
                    isAntiAlias: true,
                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: Colors.black87,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  image: DecorationImage(
                    image: AssetImage(""),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    opacity: 1.8,
                    isAntiAlias: true,
                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: Colors.black87,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  image: DecorationImage(
                    image: AssetImage(""),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    opacity: 1.8,
                    isAntiAlias: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
