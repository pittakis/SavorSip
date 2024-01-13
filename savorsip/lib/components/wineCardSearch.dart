import 'package:flutter/material.dart';
import 'package:savorsip/Models/Wines.dart';
import 'package:savorsip/Models/rating.dart';

class WineCardSearch extends StatefulWidget {
  final Wine wineDetails;
  final Function(double) onRate;
  final String userID;
  //variable RatingVal

  const WineCardSearch(
      {super.key,
      required this.wineDetails,
      required this.onRate,
      required this.userID});

  @override
  _WineCardSearchState createState() => _WineCardSearchState();
}

class _WineCardSearchState extends State<WineCardSearch> {
  bool isExpanded = false;
  double sliderValue = 1;
  bool rated = false;
  double rating = -1;
  double ratingOftheUser = 0;
  bool isLoading = true; // New variable to track loading state

  @override
  void initState() {
    super.initState();
    getRating(); // Fetch rating on init
  }

  void getRating() async {
    try {
      print(
          "Fetching rating for ${widget.userID} and ${widget.wineDetails.wid}");
      Rating? fetchedRating =
          await Rating.fetchRating(widget.userID, widget.wineDetails.wid);
      print("Fetched rating: $fetchedRating");
      if (fetchedRating != null && mounted) {
        setState(() {
          rated = true;
          rating = fetchedRating.ratingOftheUser;
          sliderValue = fetchedRating.ratingOftheUser;
          isLoading = false;
        });
      } else {
      if (mounted) {
        setState(() {
          isLoading = false;
          rated = false; // Ensure this is set to false if no rating is found
        });
      }
    }
    } catch (e) {
      print('An error occurred: $e');
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

void updateRating() async {
  try {
    await Rating.updateRating(
        widget.userID, widget.wineDetails.wid, ratingOftheUser);
    // Update the local state to reflect the new rating immediately
    if (mounted) {
      setState(() {
        rated = true;
        rating = ratingOftheUser;
        sliderValue = ratingOftheUser;
      });
    }
    // Optionally, you can fetch the latest rating again to ensure consistency
    getRating();
  } catch (e) {
    if (mounted) {
      setState(() {});
    }
    print('An error occurred: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator(); // Show loading indicator while data is being fetched
    }
    // Determine if the winePic is a network image or an asset
    final isNetworkImage =
        Uri.tryParse(widget.wineDetails.winePic)?.hasAbsolutePath ?? false;

    if (rating != -1) {
      rated = true;
      sliderValue = rating;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                isNetworkImage
                    ? Image.network(
                        widget.wineDetails.winePic,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        widget.wineDetails.winePic,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                const SizedBox(width: 10),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.wineDetails.wineName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text('SS Rating: '),
                          const Icon(Icons.star, color: Colors.amber),
                          Text("${widget.wineDetails.wineRating}/5  "),
                          Text(
                            "(${widget.wineDetails.numOfRatings})",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                        Row(
                          children: [
                            const Text('Your Rating: '),
                            const Icon(Icons.star, color: Colors.deepPurple),
                            rated ? Text('$rating/5'): const Text('-')
                          ],
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon:
                      Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () => setState(() => isExpanded = !isExpanded),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 18.0),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wine Type: ${widget.wineDetails.wineType}'),
                  Text('Description: ${widget.wineDetails.wineDescription}'),
                  TextButton(
                    onPressed: () => _showRatingDialog(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 20),
                        Text(
                          'Rate',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    double initialSliderValue = sliderValue; // Store the initial value

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.star, color: Colors.amber),
              Text('Insert your rating'),
              //Icon(Icons.star, color: Colors.amber),
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            sliderValue = index + 1.0;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: index < sliderValue.toInt()
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          widget.onRate(sliderValue);
                          //rated = true;
                          isLoading = true;
                          ratingOftheUser = sliderValue;
                          updateRating();

                          Navigator.of(context).pop();
                        },
                        child: const Text('Save',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      TextButton(
                        onPressed: () {
                          // Reset the slider value to the initial value on cancel
                          setState(() => sliderValue = initialSliderValue);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
