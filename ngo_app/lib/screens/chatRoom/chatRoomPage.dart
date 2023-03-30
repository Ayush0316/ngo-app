import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/Account/edit_profile.dart';
import 'package:ngo_app/screens/home/Profile/ngo_profile.dart';
import 'package:ngo_app/screens/home/Profile/user_profile.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChatRoomPage extends StatefulWidget {
  final Map<String, dynamic> targetUser;
  final ChatRoomModel chatroom;
  String? startingMsg;
  bool reverse;

  ChatRoomPage(
      {Key? key,
      required this.targetUser,
      required this.chatroom,
      this.startingMsg,
      this.reverse = false})
      : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  TextEditingController messageController = TextEditingController();
  dynamic User;

  void sendMessage(sender, {preMsg}) async {
    String msg;
    if (preMsg != null) {
      msg = preMsg;
    } else {
      msg = messageController.text.trim();
      messageController.clear();
    }

    if (msg != "") {
      // Send Message
      MessageModel newMessage = MessageModel(
          messageid: uuid.v1(),
          sender: sender,
          createdon: DateTime.now(),
          text: msg,
          seen: false);

      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom.chatroomid)
          .collection("messages")
          .doc(newMessage.messageid)
          .set(newMessage.toMap());

      widget.chatroom.lastMessage = msg;
      FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(widget.chatroom.chatroomid)
          .set(widget.chatroom.toMap());
    }
  }

  bool first = true;

  @override
  Widget build(BuildContext context) {
    if (first) {
      User = Provider.of<Data>(context).data;
      User["uid"] = Provider.of<CustUser?>(context)!.uid;
      first = false;
    }
    if (widget.startingMsg != null && widget.startingMsg != "") {
      if (widget.reverse) {
        sendMessage(widget.targetUser["uid"], preMsg: widget.startingMsg);
        widget.reverse = false;
      } else {
        sendMessage(User["uid"], preMsg: widget.startingMsg);
      }
      widget.startingMsg = "";
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: InkWell(
            onTap: () {
              if (User["type"] == "Ngo") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return userProfile(widget.targetUser);
                }));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return profile(data: widget.targetUser);
                }));
              }
            },
            child: Row(
              children: [
                (widget.targetUser["Imgurl"] == "" ||
                        widget.targetUser["Imgurl"] == null)
                    ? CircleAvatar(
                        child: Icon(Icons.person),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.purple[800],
                        backgroundImage:
                            NetworkImage(widget.targetUser["Imgurl"]),
                      ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.targetUser["name"],
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: Container(
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
                        if (snapshot.hasData && !snapshot.data!.docs.isEmpty) {
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
                                    width: (currentMessage.text!.length >=
                                            MediaQuery.of(context).size.width /
                                                8)
                                        ? MediaQuery.of(context).size.width - 50
                                        : null,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 2,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          (currentMessage.sender == User["uid"])
                                              ? Colors.grey
                                              : Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      currentMessage.text.toString(),
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
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
                        sendMessage(User["uid"]);
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
