import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';

class SearchScreen extends StatefulWidget {
  final Users currentUser;
  const SearchScreen({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            SearchBar(),
            const SizedBox(height: 100),  
            const Text('Search Screen'),
            
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 184, 221), // Light purple color
        borderRadius: BorderRadius.circular(20.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 4, // Blur radius
            offset: const Offset(0, 2), // Offset in the x, y direction
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          prefixIcon: Icon(
            color: Colors.white,
            Icons.search,
          ),
          border: InputBorder.none, // Remove default border
        ),
        onChanged: (value) {
          // Add your logic for live search suggestions or processing the search term
        },
      ),
    );
  }
}
