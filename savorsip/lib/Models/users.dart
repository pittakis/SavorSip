import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

//Method to add User
  static Future<String> addUser(String firstName, String lastName, String email, String username, String password) async {
    try {
      // Check if the username already exists
      var existingUser = await FirebaseFirestore.instance.collection('Users')
          .where('username', isEqualTo: username)
          .get();
    
      if (existingUser.docs.isNotEmpty) {
        return 'Username already in use. Please choose a different one.';
      }

      // Create user with Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the UID of the newly created user
      String userId = userCredential.user!.uid;

      // Add additional user details to Firestore
      await FirebaseFirestore.instance.collection('Users').doc(userId).set({
        'First Name': firstName,
        'Last Name': lastName,
        'email': email,
        'username': username,
        'numOfRating': 0,
      });

      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return 'An error occurred. Please try again.';
    } catch (e) {
      return 'An unexpected error occurred. Please try again.';
    }
  }

//Method to get a User by email
  static Future<Users?> getUserByEmail(String email) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = querySnapshot.docs.first;
      String uid = userDoc.id; // Extract the uid
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      return Users.fromMap(userData, uid);
    } else {
      return null;
    }
  }
}
