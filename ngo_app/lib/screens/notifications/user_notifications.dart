import "package:flutter/material.dart";
import "package:get/get.dart";

class noti_user extends StatefulWidget {
  const noti_user({super.key});
  @override
  State<noti_user> createState() => _noti_userState();
}

class _noti_userState extends State<noti_user> {
  // DataController dataController = Get.find<DataController>();
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(false),
            ),
            backgroundColor: Colors.blue,
            title: const Text("Notifications"),
            elevation: 0.0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              // child: Obx(() => ListView.builder(
              //       physics: NeverScrollableScrollPhysics(),
              //       scrollDirection: Axis.vertical,
              //       itemCount: 5,
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {},
              //     )),
            ),
          ),
        ),
      );
}
