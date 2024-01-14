import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:savorsip/Models/Wines.dart';
import 'package:savorsip/Models/users.dart';

class Rating {
  final String uid;
  final String wid;
  double ratingOftheUser;
  DateTime ratingTime;
  double? latitude; // Add latitude
  double? longitude; // Add longitude
  String? city; // Add city
  String? country; // Add country

  Rating({
    required this.wid,
    required this.uid,
    required this.ratingOftheUser,
    DateTime? ratingTime,
    this.latitude,
    this.longitude,
    this.city,
    this.country,
  }) : ratingTime = ratingTime ?? DateTime.now();

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
      ratingOftheUser: data['ratingOftheUser'],
      ratingTime: ratingTime,
      latitude: data['latitude'] as double?,
      longitude: data['longitude'] as double?,
      city: data['city'] as String?,
      country: data['country'] as String?,
    );
  }

  static Future<void> updateRating(
      String uid, String wid, double newRating) async {
    try {
      //
      Rating? currentRate = await fetchRating(uid, wid);
      //if null .... ++ user Rating number, wine: number of ratings n ++, wine rating = (wineRating*n-1 + new rating)/n
      if (currentRate == null) {
        Wine.updateWineRating(wid, -1, newRating);
        Users.addOneMoreRating(uid: uid);
      } else {
        Wine.updateWineRating(wid, currentRate.ratingOftheUser, newRating);
      }

      //else ... wineRating = (wineRating*n + newRating - currentrating.ratingoftheuser)/n

      // Get current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      //print(position);
      // Get address information using geocoding
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      String docId = '$uid-$wid';
      await FirebaseFirestore.instance.collection('Ratings').doc(docId).set({
        'uid': uid,
        'wid': wid,
        'ratingOftheUser': newRating,
        'ratingTime': DateTime.now(),
        'latitude': position.latitude,
        'longitude': position.longitude,
        'city': placemarks[0].locality,
        'country': placemarks[0].country,
      }, SetOptions(merge: true));
    } catch (e) {
      return Future.error('Error updating/creating rating: $e');
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
          'userRating':
              ratingDoc.data()['ratingOftheUser'] // User's rating for the wine
        });
      }
    }

    return userRatings;
  }

  // Function to get ratings of all user's friends
  static Future<List<Rating>> fetchFriendsRatings(String uid) async {
    List<Rating> friendsRatings = [];

    try {
      // Fetch user's friends
      var friendsSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('friends')
          .get();

      // Iterate over each friend and fetch their ratings
      for (var friendDoc in friendsSnapshot.docs) {
        String friendId = friendDoc.id;
        var ratingsSnapshot = await FirebaseFirestore.instance
            .collection('Ratings')
            .where('uid', isEqualTo: friendId)
            .get();

        for (var ratingDoc in ratingsSnapshot.docs) {
          var data = ratingDoc.data();
          var ratingTime = (data['ratingTime'] as Timestamp).toDate();

          Rating rating = Rating(
            uid: friendId,
            wid: data['wid'],
            ratingOftheUser: data['ratingOftheUser'],
            ratingTime: ratingTime,
            latitude: data['latitude'] as double?,
            longitude: data['longitude'] as double?,
            city: data['city'] as String?,
            country: data['country'] as String?,
          );
          friendsRatings.add(rating);
        }
      }
    } catch (e) {
      //print('Error fetching friends ratings: $e');
    }

    return friendsRatings;
  }

  // Function to retrieve all ratings and wine names for a specific user
  static Future<List<Map<String, dynamic>>> fetchUserRatingsWithWineNames(
      String uid) async {
    List<Map<String, dynamic>> userRatings = [];

    try {
      // Fetch all ratings for the user
      var ratingsSnapshot = await FirebaseFirestore.instance
          .collection('Ratings')
          .where('uid', isEqualTo: uid)
          .get();

      for (var ratingDoc in ratingsSnapshot.docs) {
        var data = ratingDoc.data();
        var wineSnapshot = await FirebaseFirestore.instance
            .collection('Wines')
            .doc(data['wid'])
            .get();

        if (wineSnapshot.exists) {
          // Combine rating data with wine name
          userRatings.add({
            'wineName': wineSnapshot
                .data()!['wineName'], // Wine name from the Wines collection
            'wid': wineSnapshot.data()!['wid'],
            'rating':
                data['ratingOftheUser'], // Rating from the Ratings collection
            'latitude':
                data['latitude'], // Latitude from the Ratings collection
            'longitude':
                data['longitude'], // Longitude from the Ratings collection
          });
        }
      }
    } catch (e) {
      //print('Error fetching user ratings: $e');
    }

    return userRatings;
  }
}
