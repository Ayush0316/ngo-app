import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/services/database.dart';
import 'package:provider/provider.dart';

class ngoNotifications extends StatefulWidget {
  const ngoNotifications({super.key});

  @override
  State<ngoNotifications> createState() => _ngoNotificationsState();
}

class _ngoNotificationsState extends State<ngoNotifications> {
  String uid = "";
  @override
  Widget build(BuildContext context) {
    uid = Provider.of<CustUser?>(context)!.uid;
    return Scaffold(
        backgroundColor: Colors.white,
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
                                  return ListTile(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(builder: (context) {
                                      //     return ChatRoomPage(
                                      //       chatroom: chatRoomModel,
                                      //       targetUser: targetUser,
                                      //     );
                                      //   }),
                                      // );
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
                                            "Wants to donate " + data['name'],
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 12),
                                          )
                                        : Text(
                                            "Volunteering for " + data['name'],
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 12)),
                                    trailing: Text(
                                      formattedDate,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    //
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
