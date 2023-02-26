import 'package:flutter/material.dart';

class Comu_recom extends StatefulWidget {
  const Comu_recom({super.key});

  @override
  State<Comu_recom> createState() => _Comu_recomState();
}

class _Comu_recomState extends State<Comu_recom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Text("List of Communities Recommended to the User"),
    );
  }
}
