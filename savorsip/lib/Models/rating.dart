class Rating {
  String wineID;
  String userID;
  double ratingOftheUser;
  //String descriptionOftheUser;
  //String venue

  Rating({
    required this.wineID,
    required this.userID,
    required this.ratingOftheUser,
  });

  @override
  String toString() {
    return 'User $userID rated wine $wineID with a score of: $ratingOftheUser';
  }
}