import "package:flutter/material.dart";
import 'package:ngo_app/services/database.dart';

class noti_user extends StatefulWidget {
  const noti_user({super.key});
  @override
  State<noti_user> createState() => _noti_userState();
}

class _noti_userState extends State<noti_user> {
  List<Map<String, dynamic>> notifications = [];

  Future<void> get_notifications() async {
    notifications = await DatabaseService().notifications();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
              title: Text("Notifications"),
              elevation: 0.0,
              backgroundColor: Colors.blue),
          body: SafeArea(
            child: FutureBuilder(
                future: get_notifications(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.separated(
                      itemBuilder: ((context, index) {
                        return InkWell(
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.person)),
                            title: Text(notifications[index]["title"]),
                            subtitle: Text(notifications[index]["name"]),
                            trailing: Icon(Icons.forward),
                          ),
                        );
                      }),
                      itemCount: notifications.length,
                      separatorBuilder: (context, index) => Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                    );
                  }
                })),
          ),
        ));
  }
}
