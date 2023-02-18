import 'package:flutter/material.dart';

class ngoCategories extends StatefulWidget {
  const ngoCategories({super.key});

  @override
  State<ngoCategories> createState() => _ngoCategoriesState();
}

class _ngoCategoriesState extends State<ngoCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: double.infinity,
      height: 300,
      child: Text("NGO Categories"),
    );
  }
}
