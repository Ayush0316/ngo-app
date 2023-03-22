import 'package:flutter/material.dart';
import 'package:ngo_app/screens/home/User/home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ngo_app/screens/Community/community_option.dart';
import 'package:ngo_app/screens/Community/community_option.dart';

String option = "";

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
              onTap: () async {
                option = "Teaching";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => community_option(text: option)));
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Colors.black87,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                      image: DecorationImage(
                        image: AssetImage("images/Teaching.jpeg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        opacity: 1.8,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: 250,
                      height: 30,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Teaching",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Black',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                option = "Cleanliness Drives";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Colors.black87,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                      image: DecorationImage(
                        image: AssetImage("images/Cleanliness_drive.jpeg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        opacity: 1.8,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: 250,
                      height: 30,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Cleanliness Drives",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Black',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Colors.black87,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                      image: DecorationImage(
                        image: AssetImage("images/Women_emp.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        opacity: 1.8,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: 250,
                      height: 30,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Women Empowerment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Black',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Colors.black87,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                      image: DecorationImage(
                        image: AssetImage("images/medical.jpeg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        opacity: 1.8,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: 250,
                      height: 30,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Medical",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Black',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Colors.black87,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                      image: DecorationImage(
                        image: AssetImage("images/distribution.jpeg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        opacity: 1.8,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: 250,
                      height: 30,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          color: Colors.blueAccent),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "PickUp and Distribution",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Black',
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: Colors.black87,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                      image: DecorationImage(
                        image: AssetImage('images/other.jpeg'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        opacity: 1.8,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 90,
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "More...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Roboto-Black',
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
