class Wine {
  String wid;
  String wineName;
  int numOfRatings;
  double wineRating;
  String wineDescription;
  String winePic;

  Wine({
    required this.wid,
    required this.wineName,
    required this.numOfRatings,
    required this.winePic,
    required this.wineRating,
    required this.wineDescription
  });

  @override
  String toString() {
    return 'Wine{wid: $wid, wineName: $wineName, numOfRatings: $numOfRatings, wineRating: $wineRating, description: $wineDescription}';
  }
}