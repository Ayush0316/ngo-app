import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:ngo_app/services/auth.dart";
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/responsive.dart';
import 'package:flutter/services.dart';

final snackBar = SnackBar(
  content: const Text('URl Copied to clipboard'),
);

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Data>(context).data;
    String name = data["name"] != null ? data["name"] : "Name";
    String url = data["Imgurl"] != null ? data["Imgurl"] : " ";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto-Black',
              ),
            ),
            elevation: 0.0,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: Container(), flex: 0),
                      (url == " ")
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage("images/logo.png"),
                            )
                          : CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.purple[800],
                              backgroundImage: NetworkImage(url),
                            ),
                      SizedBox(height: 10),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        (data["Service"] != null
                            ? data["Service"]
                            : "Services of the Ngo"),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Black',
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        (data["email"] != null ? data["email"] : "Email"),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        (data["address"] +
                            " , " +
                            data["city"] +
                            " , " +
                            data["state"] +
                            " , " +
                            data["country"]),
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
                      Container(
                        constraints: BoxConstraints(
                          minHeight: 100,
                          maxHeight: Responsive.isSmallScreen(context)
                              ? height / 3
                              : height,
                          maxWidth:
                              Responsive.isSmallScreen(context) ? width : width,
                          minWidth:
                              Responsive.isSmallScreen(context) ? width : width,
                        ), //BoxConstraints

                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),

                        child: Text(
                          (data["about"] != null
                              ? data["about"]
                              : "About the works/servics of Ngo"),
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto-Black',
                          ),
                        ),
                      ),
                      Text(
                        'Website',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 60,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              side: BorderSide(
                                color: Colors.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          // olor: Colors.blue,
                          // elevation: 0.0,
                          onPressed: () => {},
                          onLongPress: () async {
                            Clipboard.setData(
                                    ClipboardData(text: data["website"]))
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // data["website"],
                                  data["website"] != null &&
                                          data["website"] != ""
                                      ? data["website"]
                                      : 'Website not avaliable',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Icon(
                                  Icons.link,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Socials',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 60,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              side: BorderSide(
                                color: Colors.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          // olor: Colors.blue,
                          // elevation: 0.0,
                          onPressed: () => {},
                          onLongPress: () async {
                            Clipboard.setData(
                                    ClipboardData(text: data["website"]))
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // data["website"],
                                  data["socials"] != null &&
                                          data["socials"] != ""
                                      ? data["socials"]
                                      : 'Website not avaliable',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto-Black',
                                  ),
                                ),
                                Icon(
                                  Icons.people_alt_rounded,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //         top: 20, left: 20, right: 20, bottom: 10),
                      //     child: TextField(
                      //       decoration: InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         labelText: 'Write a Message',
                      //         suffixIcon: IconButton(
                      //           onPressed: () {},
                      //           icon: Icon(Icons.send_rounded),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ))),
        ));
  }
}
