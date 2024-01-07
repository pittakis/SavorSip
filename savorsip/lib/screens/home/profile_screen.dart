import 'package:flutter/material.dart';
import 'package:savorsip/components/UserTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            UserTile(firstName: "John", userName: 'giannouklas', lastName: 'Georgiadis' , leaderboardPosition: 3)
          ],
        )
      )
    );
  }
}