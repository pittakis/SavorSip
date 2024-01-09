import 'package:flutter/material.dart';
import 'package:savorsip/screens/home/friends_screen.dart';

class PendingRequests extends StatefulWidget {
  const PendingRequests({super.key});

  @override
  State<PendingRequests> createState() => _PendingRequestsState();
}

class _PendingRequestsState extends State<PendingRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Friend Requests")),
      body: myPendingRequests == null || myPendingRequests!.isEmpty
          ? const Center(
              child: Text("No pending Requests"),
            )
          : ListView.builder(
              itemCount: myPendingRequests!.length,
              itemBuilder: (context, index) {
                final item = myPendingRequests![index];
                return Dismissible(
                  key: Key(item),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      // Swiped left to dismiss/reject
                      setState(() {
                        myPendingRequests!.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$item rejected')));
                    } else if (direction == DismissDirection.startToEnd) {
                      // Swiped right to accept
                      // Implement accept logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$item accepted')));
                    }
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
                    title: Text(item),
                  ),
                );
              },
            ),
    );
  }
}
