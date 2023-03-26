import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:ngo_app/modals/user.dart";
import "package:ngo_app/screens/Community/community_screens.dart";
import "package:ngo_app/screens/notifications/details/details.dart";
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
                  if (userData.data != null && !userData.data!.isEmpty) {
                    List<Map<String, dynamic>> history = userData.data!;
                    return ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          DateTime then = history[index]["createdon"].toDate();
                          String formattedDate =
                              DateFormat('EEE d MMM\nkk:mm').format(then);
                          return ListTile(
                            onTap: () async {
                              if (history[index]["type"] == "Donated") {
                                String req_uid = history[index]["uid"];
                                Map<String, dynamic> data =
                                    await DatabaseService()
                                        .getDonationData(req_uid);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            details(notification: data)));
                              } else if (history[index]["type"] ==
                                  "volunteering") {
                              } else {
                                String comm_uid = history[index]["comm_uid"];
                                Map<String, dynamic> data =
                                    await DatabaseService()
                                        .getCommData(comm_uid);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            community_profile(data)));
                              }
                            },
                            // leading: Text("leading"),
                            title: (history[index]["type"] == "Community")
                                ? Text("Joined a " + history[index]["type"])
                                : Text("You " + history[index]["type"]),
                            subtitle: Text(history[index]["name"]),
                            trailing: Text(formattedDate),
                          );
                        });
                  } else {
                    return Center(
                        child: Text(
                      "No History avaliable",
                      style: TextStyle(color: Colors.black54),
                    ));
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ))));
  }
}
