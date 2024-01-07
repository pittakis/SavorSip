import 'package:cloud_firestore/cloud_firestore.dart';

class User {
    String? firstName;
    String? lastName;
    String? email;
    String? password;
    String? username;

    User({this.firstName, this.lastName, this.email, this.password, this.username});

    factory User.fromDocument(DocumentSnapshot doc) {
        return User(
            firstName: doc['First Name'] as String,
            lastName: doc['Last Name'] as String,
            email: doc['email'] as String,
            password: doc['password'] as String,
            username: doc['username'] as String,
        );
    }
}

Future<User> getUser(String username) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('Users')
        .where('username', isEqualTo: username)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
        // Assuming the username is unique and only one document will be returned
        return User.fromDocument(querySnapshot.docs.first);
    } else {
        throw Exception('User not found');
    }
}
