import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class communityOptions extends StatefulWidget {
  const communityOptions({super.key});

  @override
  State<communityOptions> createState() => _communityOptionsState();
}

class _communityOptionsState extends State<communityOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 247,
      width: double.infinity,
      child: Text("community options"),
    );
  }
}
