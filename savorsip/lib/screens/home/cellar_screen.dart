import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/components/components.dart';

class CellarScreen extends StatelessWidget {
  final String userID;
  const CellarScreen({Key? key, required this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("<- Show Leaderboard")),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            //_buildTopNavigation(),
            SizedBox(height: 10),
            WineCardHome(
              imageUrl: "https://via.placeholder.com/64x64",
              wineName: "Wine Name 1",
              venueName: "Venue Name 1",
              description: "Here will be the wine description 1",
              rating: 4.5,
              friendsRating: 4.2,
            ),
            SizedBox(height: 16),
            WineCardHome(
              imageUrl: "https://via.placeholder.com/64x64",
              wineName: "Wine Name 2",
              venueName: "Venue Name 2",
              description: "Here will be the wine description 2",
              rating: 4.3,
              friendsRating: 4.1,
            ),
            SizedBox(height: 10),
            //_buildBottomNavigation(),
          ],
        ),
      ),
      drawer: const Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          // Important: Remove any padding from the ListView.
          //padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              //decoration: BoxDecoration(
                //color: Colors.blue,
              //),
              child: Text('Who is more of a drunk?'),
            ),
            
          ],
        ),
      ),
    );
  }
}