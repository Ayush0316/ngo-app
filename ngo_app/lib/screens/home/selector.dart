import 'package:flutter/material.dart';
import 'package:ngo_app/screens/home/User/home.dart';
import 'package:ngo_app/screens/home/error/error.dart';
import 'package:provider/provider.dart';
import 'package:ngo_app/services/UserProvider.dart';
import 'package:ngo_app/screens/home/Ngo/Ngo_home.dart';

class Type_Selector extends StatelessWidget {
  const Type_Selector({super.key});

  @override
  Widget build(BuildContext context) {
    final type = Provider.of<Data>(context).data["type"];
    if (type == "User") {
      return Home();
    } else if (type == "Ngo") {
      return NgoHome();
    }
    // return CircularProgressIndicator(
    //   semanticsLabel: "Please Wait!!",
    // );
    return ShowError();
  }
}
