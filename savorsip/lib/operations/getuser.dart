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
        DocumentSnapshot userDoc = querySnapshot.docs.first;
        String uid = userDoc.id; // Extract the uid
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        return Users.fromMap(userData, uid);
      } else {
        return null;
      }
  }
}
