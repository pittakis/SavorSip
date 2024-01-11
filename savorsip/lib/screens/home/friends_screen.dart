//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/screens/secondary/add_friends.dart';
import 'package:savorsip/screens/secondary/pending_requests.dart';



//List<String>? myFriends = List<String>.generate(16, (i) => 'Friend No. ${i + 1}');
List<String>? myPendingRequests = List<String>.generate(2, (i) => 'Friend No. ${i + 1}');
Image genericProfilePicture = Image.asset('assets/images/profile_pic_default.png');
//List<Users>? myUserFriends = List<String>.generate(5

class FriendsScreen extends StatefulWidget {
  final String userID;
  const FriendsScreen({super.key, required this.userID});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {

  Future<List<Users>> fetchFriends() async {
    List<Users> friends = [];
    var friendsSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.userID)
        .collection('friends')
        .get();

    for (var doc in friendsSnapshot.docs) {
      String friendId = doc.id;
      var friendDoc = await FirebaseFirestore.instance.collection('Users').doc(friendId).get();
      if (friendDoc.exists) {
        friends.add(Users.fromMap(friendDoc.data()!, friendDoc.id));
      }
    }

    return friends;
  }

  Future<void> refreshFriendList() async {
    setState(() {
      // This will trigger fetchFriends() again
    });
  }

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
            onPressed: () async {
              // Delete the friend from Firestore
              await FirebaseFirestore.instance
                  .collection('Users')
                  .doc(widget.userID)
                  .collection('friends')
                  .doc(userFriend.uid)
                  .delete();

              // Close the dialog
              Navigator.of(context).pop();

              // Show a snackbar notification
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${userFriend.firstName} has been removed from your friends')),
              );

              // Trigger a refresh of the friend list
              setState(() {});
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
  ImageProvider<Object> profileImage;
  if (userFriend.profilePic.isNotEmpty && Uri.tryParse(userFriend.profilePic)?.isAbsolute == true) {
    profileImage = NetworkImage(userFriend.profilePic); // If there's a valid URL, use it
  } else {
    profileImage = AssetImage(userFriend.profilePic); // Otherwise, fall back to the generic picture
  }

  return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: profileImage,
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
                      builder: (context) => PendingRequests(myUserId: widget.userID,)),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Long Press to remove someone from your friend list", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),),
          Expanded(
            child: FutureBuilder<List<Users>>(
              future: fetchFriends(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Your friend list is empty"));
                }
                return RefreshIndicator(
                  onRefresh: refreshFriendList,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return _generateFriendTile(item, index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddFriendsScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFriendsScreen(userID: widget.userID)),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
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
