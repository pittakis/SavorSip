import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addUser(FirstName, LastName, email, username, password) {
  return firestore.collection('Users').add({
    'First Name': FirstName,
    'Last Name': LastName,
    'email': email,
    'username': username,
    'password': password,
  });
}