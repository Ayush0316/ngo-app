import 'package:flutter/material.dart';
import 'package:ngo_app/screens/home/User/Ngo categories/ngo_lists.dart';

String option = "";
String description = "";
var textList = [];

class ngoCategories extends StatefulWidget {
  const ngoCategories({super.key});
  @override
  State<ngoCategories> createState() => _ngoCategoriesState();
}

class _ngoCategoriesState extends State<ngoCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView(
          physics: new NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            InkWell(
              onTap: () async {
                option = "Nutrition";
                description =
                    "Our team believes in the power of nutrition-based community service to improve the health and well-being of individuals and families. Through education, access to nutritious food, and community partnerships, we promote healthy eating habits and prevent malnutrition in our local communities.";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFBD59),
                        Color(0xFFFF3131),
                      ],
                      stops: [
                        0.3,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.food_bank_sharp,
                      size: 50,
                      color: Colors.red,
                    ),
                    Text(
                      "Nutrition",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Environment";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.yellow,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF97E177), Color(0xFFFF02703B)],
                      stops: [
                        0.3,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.forest_sharp,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Environment",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Education";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF5CE1E6), Color(0xFFFF004AAD)],
                      stops: [
                        0.3,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.school_sharp,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Education",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Human Rights";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFADFB5), Color(0xFFFFA44F30)],
                      stops: [
                        0.3,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.gavel_sharp,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Human Rights",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Sports";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF9E830), Color(0xFFFF0F39)],
                      stops: [
                        0.3,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sports_basketball_sharp,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Sports",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Tourism";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF66C4), Color(0xFF5CE1E6)],
                      stops: [
                        0.3,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.festival_sharp,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Tourism",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Health";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFF26F7B2), Color(0xFF7CC644)],
                      stops: [
                        0.1,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.health_and_safety_sharp,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Health",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Employment";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFFC0F0F7), Color(0xFF004AAD)],
                      stops: [
                        0.1,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.badge_sharp,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Employment",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                option = "Others";
                description =
                    "this area is supposed to describe the selected files in few words (30-40 ) Words,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam turpis ex, dictum et luctus nec, malesuada id nisl. Pellentesque ";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ngo_list(
                          textList: [option, description],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Color(0xFFF93D3A), Color(0xFFFFCBC4)],
                      stops: [
                        0.1,
                        1,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Others",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        ),
      ),
      height: 375,
    );
  }
}
