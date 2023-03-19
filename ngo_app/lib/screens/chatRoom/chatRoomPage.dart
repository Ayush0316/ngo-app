// **************To activate a chat room we must call this function and do the follwing steps.

// Navigator.push(context,MaterialPageRoute(
//   builder: (context) {
//     return chatRoomPage(
//       targetUser : ---------,
//       chatroom : DatabaseService(uid).getChatRoomModel(target);,
//     )
//   }
// ))

import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class ChatRoomPage extends StatefulWidget {
  final Map<String, dynamic> targetUser;
  final ChatRoomModel chatroom;
  String? startingMsg;

  ChatRoomPage(
      {Key? key, required this.targetUser, required this.chatroom, startingMsg})
      : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  TextEditingController messageController = TextEditingController();
  dynamic User;

  void sendMessage() async {
    String msg = messageController.text.trim();
    messageController.clear();

    if (msg != "") {
      // Send Message
      MessageModel newMessage = MessageModel(
          messageid: uuid.v1(),
          sender: User.uid,
          createdon: DateTime.now(),
          text: msg,
          seen: false);

      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom.chatroomid)
          .collection("messages")
          .doc(newMessage.messageid)
          .set(newMessage.toMap());

      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom.chatroomid)
          .set(widget.chatroom.toMap());
    }
  }

  @override
  void initState() {
    User = Provider.of<Data>(context).data;
    User["uid"] = Provider.of<CustUser?>(context)!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            (widget.targetUser["Imgurl"] == "" ||
                    widget.targetUser["Imgurl"] == null)
                ? CircleAvatar(
                    backgroundImage: AssetImage("images/logo.png"),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.purple[800],
                    backgroundImage: NetworkImage(widget.targetUser["Imgurl"]),
                  ),
            SizedBox(
              width: 10,
            ),
            Text(widget.targetUser["name"]),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              // This is where the chats will go
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("chatrooms")
                        .doc(widget.chatroom.chatroomid)
                        .collection("messages")
                        .orderBy("createdon", descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          QuerySnapshot dataSnapshot =
                              snapshot.data as QuerySnapshot;

                          return ListView.builder(
                            reverse: true,
                            itemCount: dataSnapshot.docs.length,
                            itemBuilder: (context, index) {
                              MessageModel currentMessage =
                                  MessageModel.fromMap(dataSnapshot.docs[index]
                                      .data() as Map<String, dynamic>);

                              return Row(
                                mainAxisAlignment:
                                    (currentMessage.sender == User["uid"])
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: (currentMessage.sender ==
                                                User["uid"])
                                            ? Colors.grey
                                            : Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        currentMessage.text.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                                "An error occured! Please check your internet connection."),
                          );
                        } else {
                          return Center(
                            child: Text("Say hi to your new friend"),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),

              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: messageController,
                        maxLines: null,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter message"),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        sendMessage();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
