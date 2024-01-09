import 'package:flutter/material.dart';
import 'package:savorsip/screens/secondary/pending_requests.dart';

List<String>? myFriends = List<String>.generate(16, (i) => 'Friend No. ${i + 1}');
List<String>? myPendingRequests = List<String>.generate(2, (i) => 'Friend No. ${i + 1}');

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
