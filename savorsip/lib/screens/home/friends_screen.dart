import 'package:flutter/material.dart';
import 'package:savorsip/components/UserTile_friendrequest.dart';
import 'package:savorsip/components/userTile.dart';
import 'package:savorsip/components/userTileRequest.dart';


class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onVerticalDragUpdate: (details) {
              // Implement your logic for the gesture
              if (details.primaryDelta != null && details.primaryDelta! > 10) {
                // This is an example of detecting a downward swipe
                print("Swiped Down! ");
              }
            },
            child: const Text("Title"),
          ),
          // Other AppBar properties
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const SizedBox(height: 100,),
            UserTile(firstName: "John", userName: 'giannouklas', lastName: 'Georgiadis' , leaderboardPosition: 3, profilePicture: Image.asset('assets/images/profile_pic_default.png')),
            UserTile(firstName: "George", userName: 'gpit', lastName: 'Pittakis' , leaderboardPosition: 6, profilePicture: Image.asset('assets/images/logo.PNG')),
            //UserTileRequest(firstName: "John", userName: 'giannouklas', lastName: 'Georgiadis' , leaderboardPosition: 3, profilePicture: Image.asset('assets/images/logo.PNG')),
            //UserTileRequest(firstName: "John", userName: 'giannouklas', lastName: 'Georgiadis' , leaderboardPosition: 23, profilePicture: Image.asset('assets/images/logo.PNG')),
            
          ],
        )
      )
    );
  }
}