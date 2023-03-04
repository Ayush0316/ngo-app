import "package:flutter/material.dart";
import 'package:ngo_app/screens/side%20menu/sideMenu.dart';
import 'package:ngo_app/screens/home/User/search/search.dart';
import 'package:ngo_app/screens/home/User/Ngo categories/categories.dart';
import 'package:ngo_app/screens/home/User/Community options/community.dart';
import 'package:ngo_app/screens/home/User/Community options/text_community.dart';
import 'package:ngo_app/screens/home/User/about us/about.dart';
import 'package:ngo_app/screens/home/User/about%20us/title_about.dart';
import 'package:ngo_app/screens/home/User/Community recommended/recommended.dart';
import 'package:ngo_app/screens/home/User/Community recommended/text_recommended.dart';
import 'package:ngo_app/screens/home/User/about us/text_about.dart';
import 'package:ngo_app/screens/home/User/Quote/text.dart';
import 'package:ngo_app/screens/home/User/Quote/divider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            key: _key,
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
              ),
              backgroundColor: Colors.blue,
              title: const Text("Home"),
              elevation: 0.0,
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
              ],
            ),
            drawer: sideMenu(),
            body: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Column(
                  children: [
                    searchBar(),
                    SizedBox(
                      height: 5,
                    ),
                    ngoCategories(),
                    SizedBox(
                      height: 5,
                    ),
                    text_community(),
                    communityOptions(),
                    SizedBox(
                      height: 10,
                    ),
                    text_recommend(),
                    SizedBox(
                      height: 10,
                    ),
                    Comu_recom(),
                    SizedBox(
                      height: 5,
                    ),
                    title_aboutUs(),
                    SizedBox(
                      height: 5,
                    ),
                    text_aboutUS(),
                    aboutUS(),
                    SizedBox(
                      height: 10,
                    ),
                    divider_line(),
                    end_text(),
                  ],
                ),
              ),
            )),
      );
}