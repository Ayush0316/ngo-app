import 'package:flutter/material.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/authenticate/authenticate.dart';
import 'package:ngo_app/screens/home/selector.dart';
import 'package:provider/provider.dart';
import 'package:ngo_app/services/UserProvider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Return either Home or Authenticate widget.
    final user = Provider.of<CustUser?>(context);
    print("hello");
    if (user == null) {
      print("open");
      return const Authenticate();
    } else {
      print("yep");
      Provider.of<Data>(context, listen: false).updateAccount(user.uid);
      return Type_Selector();
    }
  }
}
