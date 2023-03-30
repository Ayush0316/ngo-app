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
                    "Nutrition NGOs are dedicated organizations that aim to tackle malnutrition and improve food security. They work towards providing education, resources, and support to communities in need, with a focus on promoting healthy eating habits and nutrition.";
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
                    "Environmental NGOs are non-profit organizations that work towards protecting and preserving the natural environment. They promote sustainable practices, advocate for policies that support conservation, and raise awareness about environmental issues.";
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
                    "Education NGOs focus on improving access to education and promoting literacy. They provide resources, support, and advocacy for communities in need, with a focus on increasing educational opportunities and improving quality of education.";
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
                    "Human rights NGOs are organizations that promote and protect human rights through advocacy, education, and support for marginalized communities. They work to ensure that human rights are respected, protected, and fulfilled.";
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
                    "Sports NGOs promote physical and mental health, social inclusion, and community development through sports. They provide resources, support, and education to communities, with the goal of enhancing well-being and creating positive social change.";
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
                option = "Housing";
                description =
                    "Housing NGOs work to ensure safe, affordable, and adequate housing for all. They provide resources, support, and advocacy to communities, with the goal of reducing homelessness, improving living conditions, and promoting sustainable housing policies.";
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
                      Icons.house_siding_outlined,
                      size: 45,
                      color: Colors.red,
                    ),
                    Text(
                      "Housing",
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
                    "Health NGOs aim to improve healthcare access, quality, and outcomes. They provide resources, support, and education to communities, with the goal of promoting health and well-being, preventing disease, and reducing health disparities.";
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
                    "Employment NGOs focus on creating job opportunities, providing skills training, and promoting fair labor practices. They provide resources, support, and advocacy to reduce unemployment, improve livelihoods, and promote decent work for all.";
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
                    "NGOs are non-profit organizations that work towards social, environmental, or humanitarian causes, often through direct action or advocacy.\nThis category consists the list of NGOs working in different fields";
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
      height: 350,
    );
  }
}
