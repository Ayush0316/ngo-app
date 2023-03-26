import 'package:flutter/material.dart';
import 'package:ngo_app/screens/Account/account.dart';
import 'package:ngo_app/screens/home/Ngo/Notifications/notifications.dart';
import 'package:ngo_app/screens/home/selector.dart';
import 'package:ngo_app/screens/notifications/ngo_notifications.dart';
import "package:ngo_app/services/auth.dart";
import 'package:ngo_app/services/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:ngo_app/screens/Account/settings.dart';
import 'package:ngo_app/screens/notifications/user_notifications.dart';
import 'package:ngo_app/screens/History/history_user.dart';
import 'package:ngo_app/screens/History/history_ngo.dart';
import 'package:ngo_app/screens/Help and Feedback/help_feedback.dart';
import 'package:ngo_app/screens/home/Profile/ngo_profile.dart';
import 'package:ngo_app/screens/home/Profile/user_profile.dart';

class sideMenu extends StatefulWidget {
  const sideMenu({super.key});

  @override
  State<sideMenu> createState() => _sideMenuState();
}

class _sideMenuState extends State<sideMenu> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context).data;
    String name = data["name"] != null ? data["name"] : "Name";
    String url = data["Imgurl"] != null ? data["Imgurl"] : " ";
    return Drawer(
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              (data["email"] != null ? data["email"] : "Email"),
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            accountName: Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            currentAccountPicture: (url == " ")
                ? CircleAvatar(
                    backgroundImage: AssetImage("images/logo.png"),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.blue[300],
                    backgroundImage: NetworkImage(url),
                  ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Type_Selector()));
            },
          ),
          // Visibility(
          //   visible: (data["type"] == "Ngo"),
          //   child: ListTile(
          //     title: Text(
          //       'Profile',
          //       style: TextStyle(
          //         // decoration: TextDecoration.underline,
          //         fontSize: 20.0,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Roboto-Black',
          //       ),
          //     ),
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => profile(data: data)));
          //     },
          //   ),
          // ),
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () {
              if (data["type"] == "User") {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => userProfile(data)));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => profile(data: data)));
              }
            },
          ),
          ListTile(
            title: Text(
              'History',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () {
              if (data["type"] == "User") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const history_user()));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const history_ngo()));
              }
            },
          ),
          ListTile(
            title: Text(
              'Notifications',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () async {
              if (data["type"] == "User") {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const noti_user()));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ngoNotifications()));
              }
            },
          ),
          ListTile(
            title: Text(
              'Account',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Account()));
            },
          ),
          ListTile(
            title: Text(
              'Settings',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const settings_user()));
            },
          ),
          ListTile(
            title: Text(
              'Help and Feedback',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const help_feedback()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_sharp,
              color: Colors.deepPurple,
            ),
            title: Text(
              "LogOut",
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () async {
              while (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
