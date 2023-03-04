import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class aboutUS extends StatefulWidget {
  const aboutUS({super.key});

  @override
  State<aboutUS> createState() => _aboutUSState();
}

class _aboutUSState extends State<aboutUS> {
  int activeIndex = 0;
  final urlImages = [
    "https://i.ibb.co/ZGCCM4z/about-us-employment.jpg",
    "https://i.ibb.co/YNq5TBv/about-us-animals.jpg",
    "https://i.ibb.co/60VwJr8/about-us-cleanliness.jpg",
    "https://i.ibb.co/NNTVPRV/about-us-women.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      child: Column(
        // padding: const EdgeInsets.all(5.0),
        children: [
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
              pageSnapping: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 700),
              viewportFraction: 0.7,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
          ),
          const SizedBox(height: 8),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.grey,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ));
  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
      effect: JumpingDotEffect(
        dotWidth: 12,
        dotHeight: 12,
      ));
}
