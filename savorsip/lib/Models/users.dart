import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String uid;
  String firstName;
  String lastName;
  String username; 
  String email;
  int numOfRatings;

  Users({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.numOfRatings,
  });

  @override
  String toString() {
    return 'Users{uid: $uid, firstName: $firstName, lastName: $lastName, username: $username, email: $email, numOfRatings: $numOfRatings}';
  }
  // Factory constructor to create a Users object from a map (Firestore data)
  factory Users.fromMap(Map<String, dynamic> data, String uid) {
    return Users(
      uid: uid,
      firstName: data['First Name'] ?? '',
      lastName: data['Last Name'] ?? '',
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      numOfRatings: data['numOfRating'] ?? '',
    );
  }

  // Method to convert Users object to a map
  Map<String, dynamic> toMap() {
    return {
      'First Name': firstName,
      'Last Name': lastName,
      'username': username,
      'email': email,
      'numOfRating': numOfRatings,
    };
  }

  // Method to fetch user data from Firestore
  static Future<Users> fetchUserData(String uid) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();
    return Users.fromMap(userDoc.data() as Map<String, dynamic>, uid);
  }

  // Method to update user data in Firestore
  Future<void> updateUserData() async {
    await FirebaseFirestore.instance.collection('Users').doc(uid).update(toMap());
  }
}
