import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to update the leaderboard when a user rates a wine
  static Future<void> updateLeaderboard(String userId, String username, int numberOfRatings) async {
    DocumentReference leaderboardRef = _firestore.collection('leaderboard').doc(userId);

    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot leaderboardSnapshot = await transaction.get(leaderboardRef);

      if (!leaderboardSnapshot.exists) {
        // Add the user to the leaderboard with an initial rating count of 1
        transaction.set(leaderboardRef, {
          'userId': userId,
          'username': username,
          'numberOfRatings': numberOfRatings, // Initial rating count
        });
      } else {
        // Increment the user's rating count
        int currentRatingCount = leaderboardSnapshot['numberOfRatings'] as int;
        transaction.update(leaderboardRef, {
          'numberOfRatings': currentRatingCount + 1,
        });
      }
    });
  }

  // Function to retrieve a user's position in the leaderboard
  static Future<int> getUserPosition(String userId) async {
    QuerySnapshot leaderboardSnapshot = await _firestore.collection('leaderboard')
        .orderBy('numberOfRatings', descending: true)
        .get();

    int position = 1;
    for (var doc in leaderboardSnapshot.docs) {
      if (doc.id == userId) {
        return position;
      }
      position++;
    }

    return -1; // Return -1 or some indicator if the user is not found
  }

  // Function to retrieve and print the leaderboard, returning it as an array
  static Future<List<Map<String, dynamic>>> getLeaderboard() async {
    QuerySnapshot leaderboardSnapshot = await _firestore.collection('leaderboard')
        .orderBy('numberOfRatings', descending: true)
        .get();

    List<Map<String, dynamic>> leaderboard = [];

    for (var doc in leaderboardSnapshot.docs) {
      Map<String, dynamic> userData = {
        'userId': doc.id,
        'username': doc['username'],
        'numberOfRatings': doc['numberOfRatings'],
        // Include other relevant fields if necessary
      };

      leaderboard.add(userData);
    }

    // Print the leaderboard
    for (var user in leaderboard) {
      print('User ID: ${user['userId']}, username: ${user['username']} Number of Ratings: ${user['numberOfRatings']}');
    }

    return leaderboard;
  }
}
