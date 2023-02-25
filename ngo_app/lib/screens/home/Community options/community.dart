import 'package:flutter/material.dart';
import 'package:ngo_app/screens/home/home.dart';
import 'package:carousel_slider/carousel_slider.dart';

class communityOptions extends StatefulWidget {
  const communityOptions({super.key});

  @override
  State<communityOptions> createState() => _communityOptionsState();
}

class _communityOptionsState extends State<communityOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CarouselSlider(
          // scrollDirection: Axis.horizontal,
          // shrinkWrap: true,

          options: CarouselOptions(
            pageSnapping: false,
            enlargeCenterPage: true,
            autoPlay: true,
            // aspectRatio: 1,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            padEnds: false,
          ),
          items: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 4,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
