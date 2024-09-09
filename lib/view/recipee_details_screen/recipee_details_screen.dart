import 'package:flutter/material.dart';

class RecipeeDetailsScreen extends StatelessWidget {
  RecipeeDetailsScreen({super.key, required this.recipeeTitle});
  String recipeeTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeeTitle),
      ),
      backgroundColor: Colors.amber,
    );
  }
}
