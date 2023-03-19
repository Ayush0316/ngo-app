import "package:flutter/material.dart";
import 'package:ngo_app/screens/Account/ngo_acc_details.dart';
import 'package:ngo_app/screens/side%20menu/sideMenu.dart';
import "package:provider/provider.dart";
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/auth.dart';
import 'package:ngo_app/screens/Account/settings.dart';
import 'package:ngo_app/screens/Account/edit_profile.dart';
import 'package:ngo_app/screens/Account/account_details.dart';
import 'package:ngo_app/screens/Account/manage_address.dart';
import 'package:ngo_app/screens/Account/FAQ.dart';
import 'package:ngo_app/screens/notifications/user_notifications.dart';
import 'package:ngo_app/screens/History/history_user.dart';
import 'package:ngo_app/screens/History/history_ngo.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context).data;
    String url = data["Imgurl"] != null ? data["Imgurl"] : " ";
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          key: _key,
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _key.currentState?.openDrawer();
              },
            ),
            backgroundColor: Colors.blue,
            title: const Text("My Account"),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const noti_user()));
                  },
                  icon: Icon(Icons.notifications))
            ],
          ),
          drawer: sideMenu(),
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    color: Colors.lightBlue[50],
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, left: 10),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('images/logo.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  (data["name"] != null
                                      ? data["name"]
                                      : "name"),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Text(
                                  (data["email"] != null
                                      ? data["email"]
                                      : "Email"),
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Text(
                                  (data["phone_number"] != null
                                      ? data["phone_number"]
                                      : "Phone Number"),
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const profile_user()));
                                  },
                                  child: Text(
                                    "EDIT PROFILE",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Black',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(children: [
                      TextButton(
                          onPressed: () {
                            if (data["type"] == "User") {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const history()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Ngo_History()));
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "History",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Black',
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 18,
                              )
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            if (data["type"] == "User") {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const acc_details()));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const ngo_acc_details()));
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Account Details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Black',
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 18,
                              )
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const manage_address()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Manage Address",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Black',
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 18,
                              )
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const faq()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "FAQ's",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Black',
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 18,
                              )
                            ],
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const settings_user()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Settings",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Roboto-Black',
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: 18,
                              )
                            ],
                          )),
                      TextButton(
                        onPressed: () async {
                          while (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          await _auth.signOut();
                        },
                        child: Row(children: [
                          Icon(
                            Icons.logout_sharp,
                            size: 22,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "LogOut",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto-Black',
                            ),
                          )
                        ]),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
