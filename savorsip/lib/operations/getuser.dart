import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savorsip/Models/Users.dart';

class UserOperations {
  static Future<Users?> getUserByEmail(String email) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('Users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Correctly get the data as a Map<String, dynamic>
        Map<String, dynamic> userData = querySnapshot.docs.first.data() as Map<String, dynamic>;
        return Users.fromDocument(userData);
      } else {
        // User not found
        return null;
      }
  }
}