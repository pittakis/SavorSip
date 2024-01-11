import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/screens/home/friends_screen.dart';

class PendingRequests extends StatefulWidget {
  final String myUserId;
  const PendingRequests({super.key, required this.myUserId});

  @override
  State<PendingRequests> createState() => _PendingRequestsState();
}

class _PendingRequestsState extends State<PendingRequests> {

  Future<List<String>> fetchPendingRequests() async {
    List<String> pendingRequests = [];

    var snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.myUserId)
        .collection('pendingRequests')
        .get();

    for (var doc in snapshot.docs) {
      pendingRequests.add(doc.id); // Assuming the document ID is the userID of the person who sent the request
    }

    return pendingRequests;
  }

  void acceptFriendRequest(String friendUserId) async {

    // Remove the request from pendingRequests
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.myUserId)
        .collection('pendingRequests')
        .doc(friendUserId)
        .delete();

    // Add friendUserId to my user's friends collection
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.myUserId)
        .collection('friends')
        .doc(friendUserId)
        .set({'uid': friendUserId});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Friend request accepted')),
    );
  }

  void rejectFriendRequest(String friendUserId) async {
    // Remove the request from pendingRequests
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.myUserId)
        .collection('pendingRequests')
        .doc(friendUserId)
        .delete();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Friend request rejected')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friend Requests"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to FriendsScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FriendsScreen(userID: widget.myUserId),
              ),
            );
          },
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: fetchPendingRequests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text("No pending requests"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return buildRequestItem(item, index);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildRequestItem(String userId, int index) {
    return Dismissible(
      key: Key(userId),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          rejectFriendRequest(userId);
        } else if (direction == DismissDirection.startToEnd) {
          acceptFriendRequest(userId);
        }
        setState(() {
          // Update the UI
        });
      },
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0),
        child: const Icon(Icons.check, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: Text(userId), // Here you might want to display the user's name instead of userId
      ),
    );
  }
}

