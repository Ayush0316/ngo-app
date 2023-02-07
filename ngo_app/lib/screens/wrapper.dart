import 'package:flutter/material.dart';
import 'package:ngo_app/modals/user.dart';
import 'package:ngo_app/screens/authenticate/authenticate.dart';
import 'package:ngo_app/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Return either Home or Authenticate widget.
    final user = Provider.of<CustUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}