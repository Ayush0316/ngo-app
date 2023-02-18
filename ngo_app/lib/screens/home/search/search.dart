import 'package:flutter/material.dart';

class searchBar extends StatefulWidget {
  const searchBar({super.key});

  @override
  State<searchBar> createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[400],
      width: double.infinity,
      height: 60,
      child: Text("Search bar"),
    );
  }
}
