import 'package:flutter/material.dart';
import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/chatRoom/chatRoomPage.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class details extends StatefulWidget {
  Map<String, dynamic> notification;

  details({super.key, required this.notification});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  String? uid;
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
          Text(widget.notification["name"]),
          Text(widget.notification["Field"]),
          Text(widget.notification["details"]),
          ElevatedButton(
              onPressed: () async {
                final ChatRoomModel chatroom = await DatabaseService(uid: uid)
                    .getChatroomModel(widget.notification);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChatRoomPage(
                    targetUser: widget.notification,
                    chatroom: chatroom,
                  );
                }));
              },
              child: Text("I am interested"))
        ],
      )),
    );
  }
}
