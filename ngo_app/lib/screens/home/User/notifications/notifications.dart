import 'package:flutter/material.dart';
import 'package:ngo_app/services/database.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  List<Map<String, dynamic>> notifications = [];

  Future<void> get_notifications() async {
    notifications = await DatabaseService().notifications();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Notifications"), backgroundColor: Colors.blue),
      body: Container(
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
    );
  }
}
