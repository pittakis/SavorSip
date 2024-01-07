import 'package:flutter/material.dart';
import 'package:savorsip/components/WineCardHome.dart';  // Correct the path based on your project structure

class HomeNearby extends StatelessWidget {
  const HomeNearby({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopNavigation(),
            const SizedBox(height: 10),
            const WineCardHome(
              imageUrl: "https://via.placeholder.com/64x64",
              wineName: "Wine Name 1",
              venueName: "Venue Name 1",
              description: "Here will be the wine description 1",
              rating: 4.5,
              friendsRating: 4.2,
            ),
            const SizedBox(height: 16),
            const WineCardHome(
              imageUrl: "https://via.placeholder.com/64x64",
              wineName: "Wine Name 2",
              venueName: "Venue Name 2",
              description: "Here will be the wine description 2",
              rating: 4.3,
              friendsRating: 4.1,
            ),
            const SizedBox(height: 10),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavigation() {
    return Container(
      color: const Color(0xFF634E99),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 32,
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Nearby Ratings',
                  style: TextStyle(
                    color: Color(0xFF634E99),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
              ),
              child: const Center(
                child: Text(
                  'Friend Ratings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 46,
      color: const Color(0xFF634E99),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.search, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}
