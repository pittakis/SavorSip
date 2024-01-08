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
                  return Dismissible(
                    key: Key(item),
                    onDismissed: (direction) {
                      setState(() {
                        myFriends!.removeAt(index);
                      });

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('$item dismissed')));
                    },
                    background: Container(color: Colors.red),
                    child: ListTile(
                      title: Text(item),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
