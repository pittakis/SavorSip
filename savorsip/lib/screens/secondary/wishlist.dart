import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  final String userID;
  const WishlistScreen({super.key, required this.userID});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wishlist')),
      body: const Placeholder(),
    );
  }
}