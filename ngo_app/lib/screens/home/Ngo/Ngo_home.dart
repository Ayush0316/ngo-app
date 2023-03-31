import 'package:flutter/material.dart';
import 'package:ngo_app/screens/chatRoom/recentChats.dart';
import 'package:ngo_app/screens/home/User/about%20us/about.dart';
import 'package:ngo_app/screens/home/User/about%20us/text_about.dart';
import 'package:ngo_app/screens/home/User/about%20us/title_about.dart';
import 'package:ngo_app/screens/home/User/search/search.dart';
import 'package:ngo_app/screens/notifications/ngo_notifications.dart';
import 'package:ngo_app/screens/side%20menu/sideMenu.dart';
import 'package:ngo_app/screens/home/widgets/Community%20options/community.dart';
import 'package:ngo_app/screens/home/widgets/Community%20options/text_community.dart';
import 'package:ngo_app/screens/home/widgets/Community%20recommended/recommended.dart';
import 'package:ngo_app/screens/home/widgets/Community%20recommended/text_recommended.dart';
import 'package:ngo_app/screens/home/widgets/Quote/text.dart';
import 'package:ngo_app/screens/home/widgets/Quote/divider.dart';
import 'package:ngo_app/screens/home/Ngo/Posts/post.dart';
import 'package:ngo_app/screens/home/Ngo/Posts/title_post.dart';

class NgoHome extends StatefulWidget {
  const NgoHome({super.key});

  @override
  State<NgoHome> createState() => _NgoHomeState();
}

class _NgoHomeState extends State<NgoHome> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            key: _key,
            backgroundColor: Colors.white,
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
                IconButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ngoNotifications()));
                    },
                    icon: Icon(Icons.notifications)),
                IconButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const recentChats()));
                    },
                    icon: Icon(Icons.chat_outlined))
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
                    // notification_ngo(),
                    SizedBox(
                      height: 10,
                    ),
                    title_post(),
                    Container(
                      child: post_ngo(),
                      // height: 255,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(child: text_community()),
                    SizedBox(
                      height: 5,
                    ),
                    communityOptions(),
                    SizedBox(
                      height: 10,
                    ),
                    text_recommend(),
                    SizedBox(
                      height: 10,
                    ),
                    ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 300),
                        child: Comu_recom()),
                    SizedBox(
                      height: 10,
                    ),
                    title_aboutUs(),
                    SizedBox(
                      height: 5,
                    ),
                    text_aboutUS(),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    aboutUS(),
                    divider_line(),
                    end_text(),
                  ],
                ),
              ),
            )),
      );
}
