import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addData(FirstName, LastName, email, username, password) {
  return firestore.collection('your_collection_name').add({
    'First Name': FirstName,
    'Last Name': LastName,
    'email': email,
    'username': username,
    'password': password,
  });
}