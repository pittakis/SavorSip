class Users {
  String firstName;
  String lastName;
  String username;
  String? profilePic;
  String email;
  int numOfRatings;

  Users({
    required this.firstName,
    required this.lastName,
    required this.username,
    this.profilePic,
    required this.email,
    required this.numOfRatings,
  });

  // Factory constructor to create a User instance from a Firestore document
  factory Users.fromDocument(Map<String, dynamic> doc) {
    return Users(
      firstName: doc['FirstName'] as String,
      lastName: doc['LastName'] as String,
      username: doc['username'] as String,
      profilePic: doc['profilepic'] as String?,
      email: doc['email'] as String,
      numOfRatings: doc['NumOfRatings'] as int,
    );
  }

  // Method to convert User instance to a Map for Firestore document
  Map<String, dynamic> toDocument() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'username': username,
      'profilepic': profilePic,
      'email': email,
      'NumOfRatings': numOfRatings,
    };
  }
}
