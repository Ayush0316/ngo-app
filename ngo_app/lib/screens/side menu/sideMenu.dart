import 'package:flutter/material.dart';
import 'package:ngo_app/screens/Account/account.dart';
import 'package:ngo_app/screens/home/selector.dart';
import "package:ngo_app/services/auth.dart";
import 'package:ngo_app/services/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:ngo_app/screens/Account/settings.dart';
import 'package:ngo_app/screens/notifications/user_notifications.dart';
import 'package:ngo_app/screens/History/history.dart';
import 'package:ngo_app/screens/Help and Feedback/help_feedback.dart';

class sideMenu extends StatefulWidget {
  const sideMenu({super.key});

  @override
  State<sideMenu> createState() => _sideMenuState();
}

class _sideMenuState extends State<sideMenu> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final name_data = Provider.of<Data>(context).data["name"];
    String name = name_data != null ? name_data : "Name";
    return Drawer(
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(
              (Provider.of<Data>(context).data["email"] != null
                  ? Provider.of<Data>(context).data["email"]
                  : "Email"),
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
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const history()));
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const noti_user()));
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
