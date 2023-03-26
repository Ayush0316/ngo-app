import "package:flutter/material.dart";
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/responsive.dart';
import 'package:flutter/services.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

final snackBar = SnackBar(
  content: const Text('URl Copied to clipboard'),
);

// ignore: must_be_immutable
class community_profile extends StatefulWidget {
  Map<String, dynamic> data;

  community_profile(this.data, {super.key});

  @override
  State<community_profile> createState() => _community_profileState();
}

class _community_profileState extends State<community_profile> {
  String url = " ";
  String? uid;
  bool visible = false;

  checkJoined(uid, comm_uid) async {
    visible = await DatabaseService(uid: uid).isJoined(comm_uid);
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    uid = Provider.of<CustUser?>(context)!.uid;
    checkJoined(uid, widget.data["uid"]);
    url = widget.data["Imgurl"] != null ? widget.data["Imgurl"] : " ";
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
            widget.data["name"],
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
                          backgroundImage: AssetImage("images/logo.png"),
                          radius: 60,
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.blue[300],
                          backgroundImage: NetworkImage(url),
                        ),
                  SizedBox(height: 10),
                  Text(
                    widget.data["name"],
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                  Text(
                    widget.data["tag"],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto-Black',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    widget.data["phone_number"],
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                  Text(
                    widget.data["email"],
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
                    ),
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
                      (widget.data["about"]),
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto-Black',
                      ),
                    ),
                  ),
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
                        //copy the link address and show message
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data["socials"],
                              // 'website link, socials of the community like instagram or personal website',

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
                            //join the community
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                        //copy the link address and show message
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data["website"],
                              // 'website link, socials of the community like instagram or personal website',

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
                            //join the community
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: !visible,
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          Map<String, dynamic> toSave = {
                            "comm_uid": widget.data["uid"],
                            "user": uid,
                            "createdon": DateTime.now(),
                            "type": "Community",
                            "name": widget.data["name"]
                          };
                          await DatabaseService().joinComm(toSave);
                          setState(() {
                            visible = true;
                          });
                        },
                        icon: Icon(Icons.add),
                        label: Text("I am Interested")),
                  ),
                  Visibility(
                      visible: visible,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Join our Server!!',
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              // olor: Colors.blue,
                              // elevation: 0.0,
                              onPressed: () => {},
                              onLongPress: () async {
                                //copy the link address and show message
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.data["server"],
                                      // 'website link, socials of the community like instagram or personal website',

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
                                    //join the community
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
