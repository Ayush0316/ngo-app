import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngo_app/modals/chatRoomModel.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/chatRoom/chatRoomPage.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class ngoNotifications extends StatefulWidget {
  const ngoNotifications({super.key});

  @override
  State<ngoNotifications> createState() => _ngoNotificationsState();
}

class _ngoNotificationsState extends State<ngoNotifications> {
  String uid = "";

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
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Notifications"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Interests")
                .where("ngo", isEqualTo: uid)
                .orderBy("createdon", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData && !snapshot.data!.docs.isEmpty) {
                  QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

                  // print(data);
                  // return Text("TODO");
                  return ListView.builder(
                      itemCount: dataSnapshot.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = dataSnapshot.docs[index]
                            .data() as Map<String, dynamic>;

                        return FutureBuilder(
                            future:
                                DatabaseService(uid: data["user"]).getData(),
                            builder: (context, userData) {
                              if (userData.connectionState ==
                                  ConnectionState.done) {
                                if (userData.data != null) {
                                  Map<String, dynamic> targetUser =
                                      userData.data!;

                                  DateTime then = data["createdon"].toDate();
                                  String formattedDate =
                                      DateFormat('EEE d MMM\nkk:mm')
                                          .format(then);
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Card(
                                      elevation: 0.0,
                                      child: ListTile(
                                        onTap: () async {
                                          targetUser["uid"] = data["user"];
                                          showLoaderDialog(context);
                                          final ChatRoomModel chatroom =
                                              await DatabaseService(uid: uid)
                                                  .getChatroomModel(targetUser);
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ChatRoomPage(
                                              targetUser: targetUser,
                                              chatroom: chatroom,
                                            );
                                          }));
                                        },
                                        leading: (targetUser["Imgurl"] != null)
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    targetUser["Imgurl"]),
                                              )
                                            : CircleAvatar(
                                                child: Icon(Icons.person),
                                              ),
                                        title: Text(targetUser["name"]),
                                        subtitle: (data["type"] == "donation")
                                            ? Text(
                                                "Wants to donate " +
                                                    data['name'],
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "Volunteering for " +
                                                    data['name'],
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12)),
                                        trailing: Text(
                                          formattedDate,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        //
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              } else {
                                return Container();
                              }
                            });
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "An error occured! Please check your internet connection."),
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Notification!",
                      style: TextStyle(color: Colors.black54),
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
