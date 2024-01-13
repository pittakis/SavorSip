import 'package:cloud_firestore/cloud_firestore.dart';

class Rating {
  final String uid;
  final String wid;
  double ratingOftheUser;
  DateTime ratingTime;

  Rating({
    required this.wid,
    required this.uid,
    required this.ratingOftheUser,
    DateTime? ratingTime,
  }):ratingTime = ratingTime ?? DateTime.now();

  // Fetch a rating from Firestore
  static Future<Rating?> fetchRating(String uid, String wid) async {
    var doc = await FirebaseFirestore.instance
        .collection('Ratings')
        .doc('$uid-$wid')
        .get();

    if (!doc.exists) {
      return null;
    }
  var data = doc.data()!;
  var ratingTime = (data['ratingTime'] as Timestamp).toDate();
    return Rating(
      uid: uid,
      wid: wid,
      ratingOftheUser: doc.data()!['ratingOftheUser'],
      ratingTime: ratingTime,
    );
  }

static Future<void> updateRating(String uid, String wid, double newRating) async {
  try {
    String docId = '${uid}-$wid';
    //print('Updating/Creating rating with doc ID: $docId');
    await FirebaseFirestore.instance
        .collection('Ratings')
        .doc(docId)
        .set({
          'uid': uid,
          'wid': wid,
          'ratingOftheUser': newRating,
          'ratingTime': DateTime.now(),
        }, SetOptions(merge: true));
    //print('Rating updated/created successfully.');
  } catch (e) {
    print('Error updating/creating rating: $e');
    // Handle the error appropriately
  }
}



// List all ratings and corresponding wines for a specific user
  static Future<List<Map<String, dynamic>>> listRatings(String uid) async {
    // Fetch all ratings for the user
    var ratingsSnapshot = await FirebaseFirestore.instance
        .collection('Ratings')
        .where('uid', isEqualTo: uid)
        .get();

    List<Map<String, dynamic>> userRatings = [];

    for (var ratingDoc in ratingsSnapshot.docs) {
      var wineId = ratingDoc.data()['wid'];
      var wineSnapshot = await FirebaseFirestore.instance
          .collection('Wines')
          .doc(wineId)
          .get();

      if (wineSnapshot.exists) {
        userRatings.add({
          'wineDetails': wineSnapshot.data(), // Details of the wine
          'userRating': ratingDoc.data()['ratingOftheUser'] // User's rating for the wine
        });
      }
    }

    return userRatings;
  }
}
