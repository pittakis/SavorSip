// ignore_for_file: library_prefixes
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:savorsip/Models/leaderboard.dart';

class Users {
  String uid;
  String firstName;
  String lastName;
  String username;
  String email;
  int numOfRatings;
  String profilePic;

  Users({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.profilePic,
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
      profilePic: data['profilePic'],
      numOfRatings: data['numOfRating'] ?? '',
    );
  }

  // Method to convert Users object to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'First Name': firstName,
      'Last Name': lastName,
      'username': username,
      'email': email,
      'profilePic': profilePic,
      'numOfRating': numOfRatings,
    };
  }

  // Method to fetch user data from Firestore
  static Future<Users> fetchUserData(String uid) async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();
    return Users.fromMap(userDoc.data() as Map<String, dynamic>, uid);
  }

  // Method to update user data in Firestore
  Future<void> updateUserData() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update(toMap());
  }

//Method to add User
  static Future<String> addUser(String firstName, String lastName, String email,
      String username, String password) async {
    try {
      // Check if the username already exists
      var existingUser = await FirebaseFirestore.instance
          .collection('Users')
          .where('username', isEqualTo: username)
          .get();

      if (existingUser.docs.isNotEmpty) {
        return 'Username already in use. Please choose a different one.';
      }

      // Create user with Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the UID of the newly created user
      String uid = userCredential.user!.uid;

      // Add additional user details to Firestore
      await FirebaseFirestore.instance.collection('Users').doc(uid).set({
        'uid': uid,
        'First Name': firstName,
        'Last Name': lastName,
        'email': email,
        'username': username,
        'profilePic': "assets/images/profile_pic_default.png",
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

  static Future<void> addOneMoreRating({required String uid}) async {
    try {
      var userDoc = FirebaseFirestore.instance.collection('Users').doc(uid);

      // Fetch the current user document
      var userSnapshot = await userDoc.get();

      if (userSnapshot.exists) {
        // Get the current value of numOfRatings
        int currentNumOfRatings = userSnapshot['numOfRating'] ?? 0;
        String uN = userSnapshot['username'] ?? "";

        // Increment the numOfRatings by 1
        int updatedNumOfRatings = currentNumOfRatings + 1;

        // Update the user document in Firestore with the new numOfRatings value
        await userDoc.update({'numOfRating': updatedNumOfRatings});
        await LeaderboardService.updateLeaderboard(
            uid, uN, updatedNumOfRatings);
      } else {
        // Handle the case where the user document does not exist
        // You may want to create the document or handle it differently
      }
    } catch (e) {
      throw ('Error in updating numOfRatings: $e');
    }
  }

  // Method to update existing user data in Firestore and password in Firebase Auth
  static Future<String> updateUser({
    required String uid,
    String? firstName,
    String? lastName,
    String? username,
    String? oldPassword,
    String? newPassword,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      User? currentUser = FirebaseAuth.instance.currentUser;

      // Check if old password is empty but new password is provided
      if (oldPassword == null || oldPassword.isEmpty) {
        if (newPassword != null && newPassword.isNotEmpty) {
          return 'Please add the old password before saving.';
        }
      }

      if (oldPassword != null && oldPassword.isNotEmpty) {
        if (newPassword == null || newPassword.isEmpty) {
          return 'Please add the new password before saving.';
        }
      }

      // Authenticate the old password if it's provided
      if (oldPassword != null && newPassword != null && currentUser != null) {
        // Re-authenticate the user
        AuthCredential credential = EmailAuthProvider.credential(
          email: currentUser.email!,
          password: oldPassword,
        );

        await currentUser.reauthenticateWithCredential(credential);
        // Once re-authenticated, update the password
        await currentUser.updatePassword(newPassword);
      }

      // Prepare the update data for Firestore
      Map<String, dynamic> updateData = {};
      if (firstName != null) updateData['First Name'] = firstName;
      if (lastName != null) updateData['Last Name'] = lastName;
      if (username != null) {
        // Check if the username is already in use by another user
        var existingUser = await firestore
            .collection('Users')
            .where('username', isEqualTo: username)
            .get();

        if (existingUser.docs.any((doc) => doc.id != uid)) {
          return 'Username already in use. Please choose a different one.';
        }
        updateData['username'] = username;
      }

      // Update Firestore data if there are fields to update
      if (updateData.isNotEmpty) {
        await firestore.collection('Users').doc(uid).update(updateData);
      }

      return "Success";
    } on FirebaseAuthException catch (authError) {
      if (authError.code == 'wrong-password') {
        return 'The old password is incorrect.';
      } else if (authError.code == 'weak-password') {
        return 'The new password provided is too weak.';
      } else {
        return 'An error occurred while updating the user: ${authError.message}';
      }
    } catch (e) {
      return 'An error occurred while updating the user: ${e.toString()}';
    }
  }

// Combined method to upload a new profile picture and update Firestore
  Future<void> updateProfilePicture(XFile file) async {
    // Step 1: Upload the file to Firebase Storage
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child('profile_pictures/${Path.basename(file.path)}');
    UploadTask uploadTask = ref.putFile(File(file.path));
    await uploadTask.whenComplete(() => null);
    String fileUrl = await ref.getDownloadURL();

    // Step 2: Update the profilePic field in Firestore
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .update({'profilePic': fileUrl});
  }

// Function to fetch potential friends
  static Future<List<Users>> fetchPotentialFriends(String uid) async {
    List<Users> potentialFriends = [];

    // Fetch the user's friends
    Set<String> friendsIds = await _fetchUserFriendsIds(uid);

    // Fetch all users
    var usersSnapshot =
        await FirebaseFirestore.instance.collection('Users').get();
    for (var userDoc in usersSnapshot.docs) {
      if (!friendsIds.contains(userDoc.id) && userDoc.id != uid) {
        Users user = Users.fromMap(userDoc.data(), userDoc.id);
        potentialFriends.add(user);
      }
    }

    return potentialFriends;
  }

  // Helper function to fetch user's friends' IDs
  static Future<Set<String>> _fetchUserFriendsIds(String uid) async {
    Set<String> friendsIds = {};

    var friendsSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('friends')
        .get();

    for (var friendDoc in friendsSnapshot.docs) {
      friendsIds.add(friendDoc.id);
    }

    return friendsIds;
  }

// Method to send a friend request
  static Future<void> sendFriendRequest(
      String currentUserId, String targetUserId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(targetUserId)
          .collection('pendingRequests')
          .doc(currentUserId)
          .set({'uid': currentUserId});
    } catch (e) {
      //print('Error sending friend request: $e');
    }
  }
}
