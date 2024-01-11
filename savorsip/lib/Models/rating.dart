class Rating {
  String uid;
  String wid;
  double ratingOftheUser;
  //String descriptionOftheUser;
  //String venue

  Rating({
    required this.wid,
    required this.uid,
    required this.ratingOftheUser,
  });

  @override
  String toString() {
    return 'User $uid rated wine $wid with a score of: $ratingOftheUser';
  }

//Add rating

//update rating

}