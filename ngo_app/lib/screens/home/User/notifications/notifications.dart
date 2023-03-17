import 'package:flutter/material.dart';
import 'package:ngo_app/services/database.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  List<Map<String, dynamic>> notifications = [];

  @override
  void initState() {
    notifications = DatabaseService().notifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: Container(
        child: Text("Notifications"),
      ),
    );
  }
}
