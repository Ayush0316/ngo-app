import 'package:flutter/material.dart';
import 'package:ngo_app/responsive.dart';
// import 'package:provider/provider.dart';
import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:flutter/services.dart';
import 'package:ngo_app/screens/chatRoom/chatRoomPage.dart';
import 'package:ngo_app/services/database.dart';

final snackBar = SnackBar(
  content: const Text('URl Copied to clipboard'),
);

class profile_user extends StatelessWidget {
  const profile_user({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
              'Profile',
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
                      // // (url == " ")
                      //     ? CircleAvatar(
                      //         radius: 70,
                      //         backgroundImage: AssetImage("images/logo.png"),
                      //       )
                      //     : CircleAvatar(
                      //         radius: 70,
                      //         backgroundColor: Colors.purple[800],
                      //         backgroundImage: NetworkImage(url),
                      //       ),
                      SizedBox(height: 10),
                      Text(
                        'user name',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        ('contact details'),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Black',
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        ('user address'),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        ('volunteering interests'),
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto-Black',
                        ),
                      ),
                      Text(
                        (""),
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
                          ("may be about the user"),
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
                            // Clipboard.setData(
                            //         ClipboardData(text: widget.data["website"]))
                            //     .then((value) {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(snackBar);
                            // });
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
                                  'website',

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
                            Clipboard.setData(ClipboardData(text: 'copied'))
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
                                  'website',

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
                      // (widget.user)
                      //     ? Align(
                      //         alignment: Alignment.bottomCenter,
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(
                      //               top: 20, left: 20, right: 20, bottom: 10),
                      //           child: TextField(
                      //             controller: controller,
                      //             decoration: InputDecoration(
                      //               border: OutlineInputBorder(),
                      //               labelText: 'Write a Message',
                      //               suffixIcon: IconButton(
                      //                 onPressed: () async {
                      //                   CircularProgressIndicator();
                      //                   String text = controller.text;
                      //                   final ChatRoomModel chatroom =
                      //                       await DatabaseService(uid: userUid)
                      //                           .getChatroomModel(widget.data);
                      //                   controller.clear();
                      //                   Navigator.push(context,
                      //                       MaterialPageRoute(
                      //                           builder: (context) {
                      //                     return ChatRoomPage(
                      //                       targetUser: widget.data,
                      //                       chatroom: chatroom,
                      //                       startingMsg: text,
                      //                     );
                      //                   }));
                      //                 },
                      //                 icon: Icon(Icons.send_rounded),
                      //               ),
                      //             ),
                      //           ),
                      // ),
                      // )
                      // : Container(),
                    ],
                  ))),
        ));
  }
}
