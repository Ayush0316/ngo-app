import 'package:flutter/material.dart';
import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/chatRoom/chatRoomPage.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:ngo_app/responsive.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

// ignore: must_be_immutable
class details extends StatefulWidget {
  Map<String, dynamic> notification;
  String type;

  details({super.key, required this.notification, required this.type});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  String uid = "";
  // bool _saving = false;

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    uid = Provider.of<CustUser?>(context)!.uid;
    return Scaffold(
      backgroundColor: Color.fromARGB(249, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.notification["title"]),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container(), flex: 0),
                Container(
                  constraints: BoxConstraints(
                    minHeight: 100,
                    maxHeight:
                        Responsive.isSmallScreen(context) ? height / 3 : height,
                    maxWidth: Responsive.isSmallScreen(context) ? width : width,
                    minWidth: Responsive.isSmallScreen(context) ? width : width,
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
                    // widget.notification["Imgurl"].toString() +
                    //     '\n' +
                    "Title : " +
                        widget.notification["title"] +
                        '\n' +
                        'NGO  : ' +
                        widget.notification["name"] +
                        '\n' +
                        'Donation Field : ' +
                        widget.notification["Field"] +
                        '\n' +
                        'Details : ' +
                        widget.notification["details"],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto-Black',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    showLoaderDialog(context);
                    await DatabaseService(uid: uid).iAmInterested(
                        widget.notification["uid"],
                        widget.notification["title"],
                        widget.type,
                        widget.notification["req_uid"],
                        DateTime.now());
                    final ChatRoomModel chatroom =
                        await DatabaseService(uid: uid)
                            .getChatroomModel(widget.notification);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return ChatRoomPage(
                        targetUser: widget.notification,
                        chatroom: chatroom,
                        startingMsg: "Hey there, \nHow can we help you?",
                        reverse: true,
                      );
                    }));
                  },
                  child: Text(
                    "I am interested",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 0.0,
                    backgroundColor: Colors.blue,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  ),
                )
              ],
            )),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return new Scaffold(
  //     appBar: new AppBar(
  //       title: new Text('Flutter Progress Indicator Demo'),
  //       backgroundColor: Colors.blue,
  //     ),
  //     body: ModalProgressHUD(child: _buildWidget(), inAsyncCall: _saving),
  //   );
  // }
}
