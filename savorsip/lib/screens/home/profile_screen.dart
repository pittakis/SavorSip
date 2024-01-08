import 'package:flutter/material.dart';
import 'package:savorsip/components/UserTile.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _generateMyProfile("Giannis", "Georgiadis", "giannouklas", 20, 3,
                Image.asset('assets/images/logo.PNG'), Image.asset('assets/images/logo.PNG')),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _generateButton ("Edit Profile ", Colors.purple[400]!, Icons.edit_note),
                _generateButton ("My Ratings ", Colors.purple[400]!, Icons.star),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    _generateButton ("Sign Out ", Colors.red[400]!, Icons.exit_to_app),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

Widget _generateMyProfile(String myFirstName, String myLastName, String myUserName,
    int myNumOfReviews, int myPosition, Image myProfilePicture, Image myQRcode) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      UserTile(
          firstName: myFirstName,
          userName: myUserName,
          lastName: myLastName,
          leaderboardPosition: myPosition,
          profilePicture: myProfilePicture),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text("Total Reviews:", style: TextStyle(fontSize: 16)),
              Text("$myNumOfReviews", style: TextStyle(fontSize: 26)),
            ],
          ),
          Column(
            children: [
              const Text("Rank:", style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Text("$myPosition", style: TextStyle(fontSize: 26)),
                  if (getBadgeIcon(myPosition) != null) getBadgeIcon(myPosition)!,
                ],
              ),
              
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
        child: myQRcode,
      ),
    ],
  );
}

Widget _generateButton (String textLabel, Color buttonColor, IconData buttonIcon){
  //Prepei na prosthesoume onPressedFunction
  return Padding(
    padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
    child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      elevation: 10 // Set the desired color
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          textLabel,
          style: const TextStyle(fontSize: 20, color: Colors.white)),
        Icon(buttonIcon,  color: Colors.white) ,
      ],
    )),
  );
}