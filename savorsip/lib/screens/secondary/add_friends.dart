import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';

class AddFriendsScreen extends StatefulWidget {
  final Users currentUser;
  const AddFriendsScreen({super.key, required this.currentUser});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(title:const Text('Search for Friends')),
      body: Column(
        children: [
          _buildSearchBar(),
          //Expanded(child: _buildList()),
        ],
      )
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          // Update the state based on the search input
        },
      ),
    );
  }
}