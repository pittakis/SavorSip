//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/screens/secondary/add_friends.dart';
import 'package:savorsip/screens/secondary/pending_requests.dart';

  List<Users> friendList = [
    Users(
      uid: '1',
      firstName: 'John',
      lastName: 'Doe',
      username: 'john_doe',
      email: 'john@example.com',
      numOfRatings: 10, 
      profilePic: '',
    ),
    Users(
      uid: '2',
      firstName: 'Jane',
      lastName: 'Doe',
      username: 'jane_doe',
      email: 'jane@example.com',
      numOfRatings: 15,
      profilePic: '',
    ),
    Users(
      uid: '3',
      firstName: 'Alice',
      lastName: 'Smith',
      username: 'alice_smith',
      email: 'alice@example.com',
      numOfRatings: 20,
      profilePic: '',
    ),
    Users(
      uid: '4',
      firstName: 'Bob',
      lastName: 'Johnson',
      username: 'bob_johnson',
      email: 'bob@example.com',
      numOfRatings: 5,
      profilePic: '',
    ),
    Users(
      uid: '5',
      firstName: 'Eve',
      lastName: 'Taylor',
      username: 'eve_taylor',
      email: 'eve@example.com',
      numOfRatings: 8,
      profilePic: '',
    ),
    Users(
      uid: '1',
      firstName: 'John',
      lastName: 'Doe',
      username: 'john_doe',
      email: 'john@example.com',
      numOfRatings: 10, 
      profilePic: '',
    ),
    Users(
      uid: '2',
      firstName: 'Jane',
      lastName: 'Doe',
      username: 'jane_doe',
      email: 'jane@example.com',
      numOfRatings: 15,
      profilePic: '',
    ),
    Users(
      uid: '3',
      firstName: 'Alice',
      lastName: 'Smith',
      username: 'alice_smith',
      email: 'alice@example.com',
      numOfRatings: 20,
      profilePic: '',
    ),
    Users(
      uid: '4',
      firstName: 'Bob',
      lastName: 'Johnson',
      username: 'bob_johnson',
      email: 'bob@example.com',
      numOfRatings: 5,
      profilePic: '',
    ),
    Users(
      uid: '5',
      firstName: 'Eve',
      lastName: 'Taylor',
      username: 'eve_taylor',
      email: 'eve@example.com',
      numOfRatings: 8,
      profilePic: '',
    ),
  ];

//List<String>? myFriends = List<String>.generate(16, (i) => 'Friend No. ${i + 1}');
List<String>? myPendingRequests = List<String>.generate(2, (i) => 'Friend No. ${i + 1}');
Image genericProfilePicture = Image.asset('savorsip/assets/images/logo.PNG');
//List<Users>? myUserFriends = List<String>.generate(5

class FriendsScreen extends StatefulWidget {
  final String userID;
  const FriendsScreen({super.key, required this.userID});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {

  void _popupRemoveFriend(Users userFriend, int index) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Text(
            'Remove ${userFriend.firstName} from your friends?',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              // Remove the selected item from the list
              setState(() {
                friendList.removeAt(index);
              });

              // Close the dialog
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

  Widget _generateFriendTile(Users userFriend, int index){
  //Icon? userBadge = getBadgeIcon(userFriend.leaderboardPosition);
  return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: genericProfilePicture.image,
      ),
      title: Row(
        children: [
          Text(
            '${userFriend.firstName} ${userFriend.lastName}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          //if (userBadge != null) userBadge, // Display badge if not null
          const Icon(Icons.wine_bar),
        ],
      ),
      subtitle: Text(userFriend.username,
          style: const TextStyle(
              fontSize: 14, color: Color.fromARGB(255, 124, 112, 112))),
      onLongPress: () => _popupRemoveFriend(userFriend, index),
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
                  MaterialPageRoute(
                      builder: (context) => const PendingRequests()),
                );
              },
            ),
          ),
        ],
      ),
      body: friendList == null || friendList.isEmpty
          ? const Center(
              child: Text("Your friend list is empty"),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: friendList.length,
                itemBuilder: (context, index) {
                  final item = friendList[index];
                  return _generateFriendTile(item, index);
                },
              ),
            ),
      floatingActionButton: ClipOval(
        child: Material(
          color: Colors.purple, // Button color
          child: InkWell(
            onTap: () {
              // Action to be performed when the FAB is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddFriendsScreen(userID: widget.userID,)), // Replace MyRatingsScreen with your actual screen
              );
            },
            child: const SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                Icons.add,
                color: Colors.white, // Icon color
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

Icon? getBadgeIcon(int position) {
  if (position == 1) {
    return const Icon(Icons.wine_bar_sharp, color: Colors.amber);
  } else if (position == 2) {
    return const Icon(Icons.wine_bar_sharp,
        color: Color.fromARGB(255, 117, 116, 114));
  } else if (position == 3) {
    return const Icon(Icons.wine_bar_sharp,
        color: Color.fromARGB(255, 166, 102, 72));
  } else if (position <= 20) {
    return const Icon(Icons.check_circle,
        color: Color.fromARGB(255, 203, 81, 81));
  } else {
    return null;
  }
}
