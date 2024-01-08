import 'package:flutter/material.dart';
import 'package:savorsip/components/UserTile.dart';
import 'package:savorsip/components/components.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("")),
      body: const Placeholder()
    );
  }
}