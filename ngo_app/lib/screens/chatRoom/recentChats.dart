import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/chatRoom/ChatRoomPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class recentChats extends StatefulWidget {
  const recentChats({Key? key}) : super(key: key);

  @override
  _recentChatsState createState() => _recentChatsState();
}

class _recentChatsState extends State<recentChats> {
  dynamic User;
  bool first = true;

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      User = Provider.of<Data>(context).data;
      User["uid"] = Provider.of<CustUser?>(context)!.uid;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Chats"),
      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("chatrooms")
                .where("participants.${User["uid"]}", isEqualTo: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot chatRoomSnapshot =
                      snapshot.data as QuerySnapshot;

                  return ListView.builder(
                    itemCount: chatRoomSnapshot.docs.length,
                    itemBuilder: (context, index) {
                      ChatRoomModel chatRoomModel = ChatRoomModel.fromMap(
                          chatRoomSnapshot.docs[index].data()
                              as Map<String, dynamic>);

                      Map<String, dynamic> participants =
                          chatRoomModel.participants!;

                      List<String> participantKeys = participants.keys.toList();
                      participantKeys.remove(User["uid"]);

                      return FutureBuilder(
                        future:
                            DatabaseService(uid: participantKeys[0]).getData(),
                        builder: (context, userData) {
                          if (userData.connectionState ==
                              ConnectionState.done) {
                            if (userData.data != null) {
                              Map<String, dynamic> targetUser = userData.data!;
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ChatRoomPage(
                                        chatroom: chatRoomModel,
                                        targetUser: targetUser,
                                      );
                                    }),
                                  );
                                },
                                leading: (targetUser["Imgurl"] != null)
                                    ? CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(targetUser["Imgurl"]),
                                      )
                                    : CircleAvatar(
                                        child: Icon(Icons.person),
                                      ),
                                title: Text(targetUser["name"]),
                                subtitle: (chatRoomModel.lastMessage != null)
                                    ? Text(chatRoomModel.lastMessage.toString())
                                    : Text(
                                        "Say hi!!",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return Container();
                          }
                          // return Container();
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text("No Chats"),
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
    );
  }
}
