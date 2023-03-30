import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ngo_app/screens/Community/community_option.dart';

String option = "";
String description = "";
var textList = [];

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
                description =
                    "Teaching communities involves providing education and training to groups of people with a common interest or need. This can include formal or informal learning, mentorship, and skill-building activities. ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => community_option(
                          textList: [option, description],
                        )));
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
              onTap: () async {
                option = "Clean City";
                description =
                    "Cleanliness communities are groups of people who work together to promote and maintain hygiene and cleanliness in their surroundings, often through community-driven efforts and advocacy. ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => community_option(
                          textList: [option, description],
                        )));
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
                          "Clean City",
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
              onTap: () async {
                option = "Women Empowerment";
                description =
                    "Women empowerment communities involve groups of people who work towards promoting gender equality and empowering women, often through education, advocacy, and supporting women's rights.";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => community_option(
                          textList: [option, description],
                        )));
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
              onTap: () async {
                option = "Medical";
                description =
                    "Medical communities consist of healthcare professionals who collaborate to provide patient care, share knowledge and experience, and advance research in a specific field or specialty. ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => community_option(
                          textList: [option, description],
                        )));
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
              onTap: () async {
                option = "Skill Development";
                description =
                    "Skill development communities involve groups of people who come together to learn, practice, and improve their skills, often with the goal of advancing their careers or pursuing personal interests.";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => community_option(
                          textList: [option, description],
                        )));
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
                        image: AssetImage("images/distribution.jpg"),
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
                          "Skill Development",
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
              onTap: () async {
                option = "More";
                description =
                    "Communities are groups of people with common interests, values, and goals.\nThis category encompasses communities that work in various fields and industries, each with their own unique goals, values, and interests.";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => community_option(
                          textList: [option, description],
                        )));
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
