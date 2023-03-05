import "package:flutter/material.dart";
import 'package:ngo_app/screens/side%20menu/sideMenu.dart';
import "package:provider/provider.dart";
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/auth.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isHomePageSelected = true;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) => GestureDetector(
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
                IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
              ],
            ),
            drawer: sideMenu(),
            body: SafeArea(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
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
                                radius: 70,
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
                                    (Provider.of<Data>(context)
                                                .data["user_name"] !=
                                            null
                                        ? Provider.of<Data>(context)
                                            .data["user_name"]
                                        : "User_name"),
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Black',
                                    ),
                                  ),
                                  Text(
                                    (Provider.of<Data>(context).data["email"] !=
                                            null
                                        ? Provider.of<Data>(context)
                                            .data["email"]
                                        : "User_Email"),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Black',
                                    ),
                                  ),
                                  Text(
                                      (Provider.of<Data>(context)
                                                  .data["phone_number"] !=
                                              null
                                          ? Provider.of<Data>(context)
                                              .data["phone_number"]
                                          : "Phone Number"),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto-Black',
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  OutlinedButton(
                                      // style: But,
                                      onPressed: () {},
                                      child: Text("Edit Profile")),
                                ],
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Column(children: [
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "History",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                )
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Account Details",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                )
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Manage Address",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                )
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "FAQ's",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                )
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 20,
                                )
                              ],
                            )),
                        TextButton(
                          onPressed: () async {
                            await _auth.signOut();
                          },
                          child: Row(children: [
                            Icon(
                              Icons.logout_sharp,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "LogOut",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
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
