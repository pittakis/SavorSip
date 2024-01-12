import 'package:cloud_firestore/cloud_firestore.dart';

class Rating {
  final String uid;
  final String wid;
  final double ratingOftheUser;
  //final String city;
  //final DateTime dateOfRate;
  //final double latitude;
  //final double longitude;

  Rating({
    required this.wid,
    required this.uid,
    required this.ratingOftheUser
    //required this.city,
     //required this.latitude,
    //required this.longitude,
  });// : dateOfRate = DateTime.now();

  @override
  String toString() {
    return 'User $uid rated $wid';
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'wid': wid,
      'ratingOftheUser': ratingOftheUser,
      //'city': city,
      //'dateOfRate': dateOfRate.toIso8601String(), // Convert DateTime to a String
    };
  }

// Convert a map into a Rating object
  static Rating fromJson(Map<String, dynamic> json) {
    return Rating(
      uid: json['uid'] as String,
      wid: json['wid'] as String,
      ratingOftheUser: (json['ratingOftheUser'] as num).toDouble(), // Firestore stores numbers as num, so convert to double
      //city: json['city'] as String,
      //dateOfRate: DateTime.parse(json['dateOfRate'] as String),
    );
  }






//Add rating
Future<void> addRating(String uid, String wid, double ratingOftheUser) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference docRef = firestore.collection('Rating').doc('$uid-$wid');

  // Check if the document exists to enforce the uniqueness of (uid, wid)
  DocumentSnapshot docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    print('Rating already exists for this uid and wid combination.');
    return;
  }

  // If not exists, create a new Rating
  Rating rating = Rating(
    uid: uid,
    wid: wid,
    ratingOftheUser: ratingOftheUser,
    //city: 'YourCity', // Modify this based on your application's requirement
    // latitude and longitude can be added similarly
  );

  await docRef.set(rating.toJson());
  print('Rating added successfully.');
}



}
//update rating
Future<void> addOrUpdateRating(String uid, String wid, double ratingOftheUser) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference docRef = firestore.collection('Ratings').doc('$uid-$wid');

  // Check if the document exists
  DocumentSnapshot docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    // If exists, update the existing rating
    await docRef.update({'ratingOftheUser': ratingOftheUser});
    print('Rating updated successfully for $uid and $wid.');
  } else {
    // If not exists, create a new Rating
    Rating rating = Rating(
      uid: uid,
      wid: wid,
      ratingOftheUser: ratingOftheUser,
    );
    await docRef.set(rating.toJson());
    print('Rating added successfully for $uid and $wid.');
  }
}



//search
Future<double> findRating(String uid, String wid) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DocumentReference docRef = firestore.collection('Ratings').doc('$uid-$wid');

  DocumentSnapshot docSnapshot = await docRef.get();
  if (docSnapshot.exists) {
    Rating rating = Rating.fromJson(docSnapshot.data() as Map<String, dynamic>);
    print('Rating found: ${rating.ratingOftheUser}');
    return rating.ratingOftheUser.toDouble(); // Assuming ratingOftheUser is double, converting to int
  } else {
    print('No rating found for this uid and wid combination.');
    return -1;
  }
}