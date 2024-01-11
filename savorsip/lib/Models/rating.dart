class Rating {
  final String uid;
  final String wid;
  final double ratingOftheUser;
  final String city;
  //final double latitude;
  //final double longitude;

  Rating({
    required this.wid,
    required this.uid,
    required this.ratingOftheUser,
    required this.city,
    //required this.latitude,
    //required this.longitude,
  });

   DateTime dateOfRate=DateTime.now();

  @override
  String toString() {
    return 'User $uid rated $wid at $city on $dateOfRate' ;
  }

//Add rating

//update rating

}