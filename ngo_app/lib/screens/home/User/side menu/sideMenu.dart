import 'package:flutter/material.dart';
import "package:ngo_app/services/auth.dart";
import 'package:ngo_app/services/UserProvider.dart';
import 'package:provider/provider.dart';

class sideMenu extends StatefulWidget {
  const sideMenu({super.key});

  @override
  State<sideMenu> createState() => _sideMenuState();
}

class _sideMenuState extends State<sideMenu> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            // decoration: BoxDecoration(
            //     // color: Colors.white,
            //     ),
            accountEmail: Text(
              (Provider.of<Data>(context).data["email"] != null
                  ? Provider.of<Data>(context).data["email"]
                  : "User_Email"),
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            accountName: Text(
              (Provider.of<Data>(context).data["user_name"] != null
                  ? Provider.of<Data>(context).data["user_name"]
                  : "User_Name"),
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Good Points',
              style: TextStyle(
                // decoration: TextDecoration.underline,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto-Black',
              ),
            ),
            onTap: () {
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
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
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_sharp),
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
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
