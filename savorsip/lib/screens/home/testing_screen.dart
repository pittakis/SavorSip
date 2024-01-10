//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';

class TestingScreen extends StatefulWidget {
  final Users currentUser;
  const TestingScreen({super.key, required this.currentUser});
  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: const Placeholder(),
    );
  }
}