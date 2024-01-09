import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/screens/secondary/pending_requests.dart';

Users 
List<String>? myFriends = List<String>.generate(16, (i) => 'Friend No. ${i + 1}');
List<String>? myPendingRequests = List<String>.generate(2, (i) => 'Friend No. ${i + 1}');
Image genericProfilePicture = Image.asset('savorsip/assets/images/logo.PNG');
//List<Users>? myUserFriends = List<String>.generate(5

class TestingScreen extends StatefulWidget {
  const TestingScreen({super.key});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {

  void _popupRemoveFriend(String friendName) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Text('Remove $friendName from your friends?', style: const TextStyle(fontSize: 16)),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // Add your confirm action code here
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Friends'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: const Icon(Icons.person_add_sharp),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PendingRequests()),
                );
              },
            ),
          ),
        ],
      ),
      body: myFriends == null || myFriends!.isEmpty
          ? const Center(
              child: Text("Your friend list is empty"),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: myFriends!.length,
                itemBuilder: (context, index) {
                  final item = myFriends![index];
                  return ListTile(
                    title: Text(item),
                    onLongPress: () => _popupRemoveFriend(item),
                  );
                },
              ),
            ),
    );
  }
}

Widget _generateFriendTile(Users userFriend){
  //Icon? userBadge = getBadgeIcon(userFriend.leaderboardPosition);
  return ListTile(
          //contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          //onTap: () {},
          leading: CircleAvatar(
            radius: 25, // Adjust the radius as needed
            backgroundImage: genericProfilePicture.image,
          ),

          title: Row(
            children: [
              Text(
                "$userFriend.firstName $userFriend.lastName ",
                style: const TextStyle(fontSize: 18,),
              ),
              //if (userBadge != null) userBadge, // Display badge if not null
            ],
          ),
          subtitle: Text(userFriend.username,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 124, 112, 112))),
        );
}

Icon? getBadgeIcon(int position) {
  if (position == 1) {
    return const Icon(Icons.wine_bar_sharp, color: Colors.amber);
  } else if (position == 2) {
    return const Icon(Icons.wine_bar_sharp, color: Color.fromARGB(255, 117, 116, 114));
  } else if (position == 3) {
    return const Icon(Icons.wine_bar_sharp, color: Color.fromARGB(255, 166, 102, 72));
  } else if (position<=20) {
    return const Icon(Icons.check_circle, color: Color.fromARGB(255, 203, 81, 81));
  } else {
    return null;
  }
}