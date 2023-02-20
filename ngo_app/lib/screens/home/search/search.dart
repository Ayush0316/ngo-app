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
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search NGO by name",
          hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.mic),
          ),
          contentPadding: EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      width: double.infinity,
      height: 45,
    );
  }
}
