import "package:flutter/material.dart";
import "package:ngo_app/modals/user.dart";
import "package:ngo_app/services/database.dart";
import "package:provider/provider.dart";

class history_user extends StatefulWidget {
  const history_user({super.key});

  @override
  State<history_user> createState() => _history_userState();
}

class _history_userState extends State<history_user> {
  String uid = '';
  @override
  Widget build(BuildContext context) {
    uid = Provider.of<CustUser?>(context)!.uid;
    return GestureDetector(
        //adding a search bar
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            backgroundColor: Color.fromARGB(249, 255, 255, 255),
            appBar: AppBar(
                leading: BackButton(
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                title: Text("History"),
                elevation: 0.0,
                backgroundColor: Colors.blue),
            body: SafeArea(
                child: FutureBuilder(
              future: DatabaseService(uid: uid).getHistory('user'),
              builder: (context, userData) {
                if (userData.connectionState == ConnectionState.done) {
                  if (userData.data != null) {
                    List<Map<String, dynamic>> history = userData.data!;
                    return ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text("leading"),
                            title: Text("title"),
                          );
                        });
                    // return ListTile(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) {
                    //         return ChatRoomPage(
                    //           chatroom: chatRoomModel,
                    //           targetUser: targetUser,
                    //         );
                    //       }),
                    //     );
                    //   },
                    //   leading: (targetUser["Imgurl"] != null)
                    //       ? CircleAvatar(
                    //           backgroundImage:
                    //               NetworkImage(targetUser["Imgurl"]),
                    //         )
                    //       : CircleAvatar(
                    //           child: Icon(Icons.person),
                    //         ),
                    //   title: Text(targetUser["name"]),
                    //   subtitle: (chatRoomModel.lastMessage != null)
                    //       ? Text(
                    //           chatRoomModel.lastMessage.toString(),
                    //           style: TextStyle(
                    //               color: Colors.black54,
                    //               fontSize: 12),
                    //         )
                    //       : Text(
                    //           "Say hi!!",
                    //           style: TextStyle(
                    //             color: Theme.of(context)
                    //                 .colorScheme
                    //                 .secondary,
                    //           ),
                    //         ),
                    // );
                  } else {
                    return Center(
                        child: Text(
                      "No History avaliable",
                      style: TextStyle(color: Colors.black54),
                    ));
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ))));
  }
}
