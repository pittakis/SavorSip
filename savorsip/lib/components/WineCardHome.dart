import 'package:flutter/material.dart';

class WineCardHome extends StatelessWidget {
  final String imageUrl;
  final String wineName;
  final String venueName;
  final String description;
  final double rating;
  final double friendsRating;

  const WineCardHome({super.key, 
    required this.imageUrl,
    required this.wineName,
    required this.venueName,
    required this.description,
    required this.rating,
    required this.friendsRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: 479,
        height: 400,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF9B8CC4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(imageUrl, wineName, venueName),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            _buildDetails(wineName, venueName, description),
            _buildRatings('SavorSip Rating', rating),
            _buildRatings("Friend's Rating", friendsRating),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String imageUrl, String wineName, String venueName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 32,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wineName,
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
                ),
                Text(
                  venueName,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(String wineName, String venueName, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(wineName, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          Text(venueName, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          Text(description, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildRatings(String title, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400)),
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFFFD700)),
              Text(
                '${rating.toStringAsFixed(1)}/5',
                style: const TextStyle(color: Color(0xFFFFD700), fontSize: 28, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
