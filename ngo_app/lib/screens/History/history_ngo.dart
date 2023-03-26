import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:ngo_app/modals/user.dart";
import "package:ngo_app/screens/Community/community_screens.dart";
import "package:ngo_app/services/database.dart";
import "package:provider/provider.dart";

class history_ngo extends StatefulWidget {
  const history_ngo({super.key});

  @override
  State<history_ngo> createState() => _history_ngoState();
}

class _history_ngoState extends State<history_ngo> {
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
              future: DatabaseService(uid: uid).getHistoryNgo(),
              builder: (context, userData) {
                if (userData.connectionState == ConnectionState.done) {
                  if (userData.data != null) {
                    List<Map<String, dynamic>> history = userData.data!;
                    return ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          DateTime then = history[index]["createdon"].toDate();
                          String formattedDate =
                              DateFormat('EEE d MMM\nkk:mm').format(then);
                          return ListTile(
                            onTap: () async {
                              if (history[index]["type"] == "Community") {
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
                              // if (history[index]["type"] == "donation") {
                              // } else if (history[index]["type"] ==
                              //     "volunteering") {
                              // } else {}
                            },
                            title: (history[index]["type"] == "Community")
                                ? Text("Joined a " + history[index]["type"])
                                : Text("Requested " + history[index]["type"]),
                            subtitle: (history[index]["type"] == "Community")
                                ? Text(history[index]["name"])
                                : Text(history[index]["title"]),
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
