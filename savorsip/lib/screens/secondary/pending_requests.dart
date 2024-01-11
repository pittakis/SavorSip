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
  Future<List<Map<String, String>>> fetchPendingRequests() async {
    List<Map<String, String>> pendingRequests = [];

    var snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.myUserId)
        .collection('pendingRequests')
        .get();

    for (var doc in snapshot.docs) {
      String userId = doc.id; // The user ID of the person who sent the request
      var userSnapshot = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
      String username = userSnapshot.data()?['username'] ?? 'Unknown'; // Fetch the username
      pendingRequests.add({'userId': userId, 'username': username}); // Add both userId and username
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

    // Add my user ID to my friends friends collection
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(friendUserId)
        .collection('friends')
        .doc(widget.myUserId)
        .set({'uid': widget.myUserId});

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
      ),
      body: FutureBuilder<List<Map<String, String>>>(
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

  Widget buildRequestItem(Map<String, String> request, int index) {
    String userId = request['userId']!;
    String username = request['username']!;

    return Dismissible(
      key: Key(userId),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          rejectFriendRequest(userId);
        } else if (direction == DismissDirection.startToEnd) {
          acceptFriendRequest(userId);
        }
        setState(() {});
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
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 2), // Only bottom border
            ),
          ),
          child: Text(
            username,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

}