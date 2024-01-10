import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/screens/home/cellar_screen.dart';
import 'package:savorsip/screens/home/friends_screen.dart';
import 'package:savorsip/screens/home/profile_screen.dart';
import 'package:savorsip/screens/home/search_screen.dart';
import 'package:savorsip/screens/home/testing_screen.dart';
import 'dart:core';

class MyHomePage extends StatefulWidget {
  final String userID;
  const MyHomePage({Key? key, required this.userID}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      CellarScreen(userID: widget.userID),
      FriendsScreen(userID: widget.userID),
      SearchScreen(userID: widget.userID),
      ProfileScreen(userID: widget.userID),
      TestingScreen(userID: widget.userID),
    ];
  }
 /* final List<Widget> _screens = [
    const CellarScreen(currentUser: currentUser),
    const FriendsScreen(),
    const SearchScreen(),
    const ProfileScreen(),
    const TestingScreen(),
  ];
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens, // Use the list of screen widgets
      ),
      floatingActionButton: _currentIndex == 2
          ? FloatingActionButton(
              onPressed: () {
                // Handle FloatingActionButton action when index is 2
              },
              child: const Icon(Icons.search),
            )
          : null, // Set to null for other indices
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Cellar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Testing',
          ),
        ],
        onTap: (index) {
          // Handle BottomNavigationBar item tap
          setState(() {
            _currentIndex = index;
          });
          // Scroll to the corresponding page
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
