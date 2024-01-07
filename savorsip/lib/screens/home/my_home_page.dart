import 'package:flutter/material.dart';
import 'package:savorsip/screens/cellar_screen.dart';
import 'package:savorsip/screens/friends_screen.dart';
import 'package:savorsip/screens/profile_screen.dart';
import 'package:savorsip/screens/search_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Create a list of screen widgets
  final List<Widget> _screens = [
    CellarScreen(),
    FriendsScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

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
            icon: Icon(Icons.wine_bar_outlined),
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
