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
      appBar: AppBar(title: const Text("")),
      body: _generateMyProfile(
          "Giannis", "Georgiadis", "giannouklas", 20, 3, Image.asset('assets\images\Crown-icon-PNG.png'))
      );
  }
}

Widget? _generateMyProfile(String myFirstName, String myLastName, String myUserName,
    int myNumOfReviews, int myPosition, Image myProfilePicture) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: UserTile(
            firstName: myFirstName,
            userName: myUserName,
            lastName: myLastName,
            leaderboardPosition: myPosition,
            profilePicture: myProfilePicture),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text("Total Reviews:"), 
              Text("$myNumOfReviews"),
            ],
          ),
          Column(
            children: [
              const Text("Rank:"), 
              Text("$myPosition"),
            ],
          ),
        ],
      )
    ],
  );
}
