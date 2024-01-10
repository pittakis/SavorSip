import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';

class MyRatingsScreen extends StatefulWidget {
  final String userID;
  const MyRatingsScreen({super.key, required this.userID});

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