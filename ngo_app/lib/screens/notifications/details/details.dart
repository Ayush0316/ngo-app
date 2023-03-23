import 'package:flutter/material.dart';
import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/chatRoom/chatRoomPage.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

// ignore: must_be_immutable
class details extends StatefulWidget {
  Map<String, dynamic> notification;

  details({super.key, required this.notification});

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
    uid = Provider.of<CustUser?>(context)!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.notification["title"]),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(widget.notification["Imgurl"].toString()),
          Text(widget.notification["name"]),
          Text(widget.notification["Field"]),
          Text(widget.notification["details"]),
          ElevatedButton(
              onPressed: () async {
                showLoaderDialog(context);
                await DatabaseService(uid: uid).iAmInterested(
                    widget.notification["uid"],
                    widget.notification["title"],
                    "donation",
                    DateTime.now());
                final ChatRoomModel chatroom = await DatabaseService(uid: uid)
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
              child: Text("I am interested"))
        ],
      )),
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
