import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';

class MyRatingsScreen extends StatefulWidget {
  final Users currentUser;
  const MyRatingsScreen({super.key, required this.currentUser});

  @override
  State<MyRatingsScreen> createState() => _MyRatingsScreenState();
}

class _MyRatingsScreenState extends State<MyRatingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Ratings"),
      ),
      body: const Placeholder()
    );
  }
}