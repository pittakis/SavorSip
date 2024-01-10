import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:savorsip/Models/leaderboard.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/components/UserTile.dart';
import 'package:savorsip/screens/authentication/login.dart';
import 'package:savorsip/screens/secondary/edit_profile.dart';
import 'package:savorsip/screens/secondary/my_ratings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  final String userID;
  const ProfileScreen({Key? key, required this.userID}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen> {

Users? currentUser; // Local variable to hold the updated user data
int userPosition = -1; // Initialize with a default value

@override
void initState() {
  super.initState();
  _fetchAndSetCurrentUser();
  _fetchUserPosition();
}

  Future<void> _fetchUserPosition() async {
    int position = await LeaderboardService.getUserPosition(widget.userID);
    setState(() {
      userPosition = position;
    });
  }

  Future<void> _fetchAndSetCurrentUser() async {
    try {
      Users fetchedUser = await Users.fetchUserData(widget.userID);
      setState(() {
        currentUser = fetchedUser;
      });
    } catch (e) {
      // Handle errors, e.g., user not found or network issues
      print("Error fetching user data: $e");
    }
  }

//sign Out Function
void signMeOut() async {
  await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),  //here we can add the newUser ass parameter
          );
  }

  void navigateToMyRatingsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyRatingsScreen(userID: widget.userID,)), // Replace MyRatingsScreen with your actual screen
    );
  }

  void navigateToEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen(userID: widget.userID,)), // Replace MyRatingsScreen with your actual screen
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text("")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        if (currentUser != null) // Check if currentUser is not null
          _generateMyProfile(
            currentUser!.firstName,
            currentUser!.lastName,
            currentUser!.username,
            currentUser!.numOfRatings, // Assuming static for now
            userPosition, // Assuming static for now
            currentUser!.profilePic,
            widget.userID,
          )
        else
          CircularProgressIndicator(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            _generateButton("Edit Profile ", Colors.purple[400]!,
                Icons.edit_note, () {
              navigateToEditProfileScreen(context); // Pass the context parameter
            }),
            _generateButton("My Ratings ", Colors.purple[400]!, Icons.star, () {
              navigateToMyRatingsScreen(context); // Pass the context parameter
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    _generateButton ("Sign Out ", Colors.red[400]!, Icons.exit_to_app, signMeOut),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}

Widget _generateMyProfile(String myFirstName, String myLastName, String myUserName,
    int myNumOfReviews, int myPosition, String myProfilePicUrl, String userID) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ListTile(
          contentPadding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(myProfilePicUrl),
          ),
          title: Row(
            children: [
              Text(
                "$myFirstName $myLastName ",
                style: const TextStyle(fontSize: 18,),
              ),
            ],
          ),
          subtitle: Text(myUserName,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 124, 112, 112))),
      ),
      const Divider(),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text("Total Reviews:", style: TextStyle(fontSize: 16)),
              Text("$myNumOfReviews", style: const TextStyle(fontSize: 26)),
            ],
          ),
          Column(
            children: [
              const Text("Rank:", style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Text("$myPosition", style: const TextStyle(fontSize: 26)),
                  if (getBadgeIcon(myPosition) != null) getBadgeIcon(myPosition)!,
                ],
              ),
              
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
        child: QrImageView(
                data: userID,
                version: QrVersions.auto,
                size: 200.0,
                gapless: false,
              )

      ),
    ],
  );
}

Widget _generateButton (String textLabel, Color buttonColor, IconData buttonIcon, Function handlePressing) {
  //Prepei na prosthesoume onPressedFunction
  return Padding(
    padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
    child: ElevatedButton(
    onPressed: () {
        handlePressing();
      },
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