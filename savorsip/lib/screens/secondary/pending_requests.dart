import 'package:flutter/material.dart';
import 'package:savorsip/screens/home/testing_screen.dart';

class PendingRequests extends StatefulWidget {
  const PendingRequests({super.key});

  @override
  State<PendingRequests> createState() => _PendingRequestsState();
}

class _PendingRequestsState extends State<PendingRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Friend Requests")),
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
                    setState(() {
                      myPendingRequests!.removeAt(index);
                    });

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('$item dismissed')));
                  },
                  background: Container(color: Colors.red),
                  child: ListTile(
                    title: Text(item),
                    // Add onPressed property to ListTile
                    onTap: () {
                      // Add your logic here for when the ListTile is pressed
                      print('ListTile pressed for item: $item');
                    },
                  ),
                );
              },
            ),
    );
  }
}
