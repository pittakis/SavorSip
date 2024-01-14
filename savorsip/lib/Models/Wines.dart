import 'package:cloud_firestore/cloud_firestore.dart';

class Wine {
  String wid;
  String wineName;
  int numOfRatings;
  double wineRating;
  String wineDescription;
  String winePic;
  String wineType;

  Wine(
      {required this.wid,
      required this.wineName,
      required this.numOfRatings,
      required this.winePic,
      required this.wineRating,
      required this.wineDescription,
      required this.wineType});

  @override
  String toString() {
    return 'Wine{wid: $wid, wineName: $wineName, wineType: $wineType, numOfRatings: $numOfRatings, wineRating: $wineRating, description: $wineDescription}';
  }

  // Factory constructor to create a Wine object from Firestore document data
  factory Wine.fromMap(Map<String, dynamic> data, String wid) {
    return Wine(
      wid: wid,
      wineName: data['wineName'],
      numOfRatings: data['numOfRatings'],
      wineRating: data['wineRating'].toDouble(), // Ensure this is a double
      wineDescription: data['wineDescription'],
      winePic: data['winePic'],
      wineType: data['wineType'],
    );
  }

  // Method to fetch a wine by its wid
  static Future<Wine?> fetchWineByWid(String wid) async {
    try {
      DocumentSnapshot wineDoc =
          await FirebaseFirestore.instance.collection('Wines').doc(wid).get();
      if (wineDoc.exists) {
        return Wine.fromMap(wineDoc.data() as Map<String, dynamic>, wid);
      }
    } catch (e) {
      //print("Error fetching wine: $e");
    }
    return null;
  }

  // Method to update wine rating and number of ratings
  static Future<void> updateWineRating(
      String wid, double oldRating, double newRating) async {
    try {
      Wine? myWine = await fetchWineByWid(wid);
      //Update case
      double newAvg = myWine!.wineRating;
      if (oldRating != -1) {
        newAvg = ((newAvg * myWine.numOfRatings) + newRating - oldRating) /
            myWine.numOfRatings;
      } else {
        myWine.numOfRatings++;
        newAvg = (newAvg * (myWine.numOfRatings - 1) + newRating) /
            myWine.numOfRatings;
      }

      await FirebaseFirestore.instance.collection('Wines').doc(wid).update({
        'wineRating': newAvg,
        'numOfRatings': myWine.numOfRatings,
      });
    } catch (e) {
      //print("Error updating wine rating: $e");
    }
  }

  // Method to check if wine is in wishlist
  static Future<bool> isWineInWishList(String userId, String wineId) async {
    var doc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('WishList')
        .doc(wineId)
        .get();
    return doc.exists;
  }

  // Method to add or remove wine from wishlist
  static Future<void> toggleWishList(
      String userId, String wineId, bool isInWishList) async {
    var wishlistRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('WishList')
        .doc(wineId);

    if (isInWishList) {
      await wishlistRef.delete(); // Remove from wishlist
    } else {
      await wishlistRef.set({'wid': wineId}); // Add to wishlist
    }
  }
}
