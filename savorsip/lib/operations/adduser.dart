import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<String> addUser(String firstName, String lastName, String email, String username, String password) async {
  try {
    // Check if the username already exists
    var existingUser = await firestore.collection('Users')
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
    await firestore.collection('Users').doc(userId).set({
      'UserId': userId,
      'First Name': firstName,
      'Last Name': lastName,
      'email': email,
      'username': username,
      'numOfRating': 0,
      // Do not store password in Firestore. Firebase Auth handles it securely.
    });

    return "Success"; // Indicate success
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    }
    return 'An error occurred. Please try again.'; // Default error message
  } catch (e) {
    return 'An unexpected error occurred. Please try again.';
  }
}
