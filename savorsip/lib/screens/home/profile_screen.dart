import 'package:flutter/material.dart';
import 'package:savorsip/components/UserTile.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  //final String title = '';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("<- Show Leaderboard")),
      body: const Center(
        child: Placeholder(),
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