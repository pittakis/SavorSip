import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/Wines.dart';
import 'package:savorsip/Models/rating.dart';
import 'package:savorsip/components/wine_card_search.dart';

class WishlistScreen extends StatefulWidget {
  final String userID;
  const WishlistScreen({super.key, required this.userID});

  @override
  State<WishlistScreen> createState() => _WishlistScreen();
}

class _WishlistScreen extends State<WishlistScreen> {
  List<Wine> allWines = []; // List to store all fetched wines
  List<Wine> filteredWines = [];
  double sliderValueMinRating = 0;
  double sliderValueMinRatingCount = 0;
  List<bool> isSelectedType = [true, true, true]; // Red, Rose, White
  bool filtersVisible = false;
  bool showOnlyMyRatings = false;
  String searchQuery = "";

  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchWinesWishList();
  }

  void updateWishlist() {
    fetchWinesWishList(); // Refetch the wishlist
  }

    void refreshWines() {
    fetchWinesWishList(); // Refetch or refresh the wines data
  }

  Future<void> fetchWinesWishList() async {
    // Fetch the wishlist
    QuerySnapshot wishListSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.userID)
        .collection('WishList')
        .get();

    // Create an empty list to store fetched wines
    List<Wine> fetchedWines = [];

    // Iterate over each document in wishlist
    for (var doc in wishListSnapshot.docs) {
      // Get the wine ID from the wishlist
      String wineId =
          doc.id; // Assuming doc.id is the wine ID, adjust if necessary

      // Fetch the wine details from the Wines collection using the wine ID
      DocumentSnapshot wineSnapshot = await FirebaseFirestore.instance
          .collection('Wines')
          .doc(wineId)
          .get();

      // Check if wine details exist and add to fetchedWines list
      if (wineSnapshot.exists) {
        fetchedWines.add(
            Wine.fromMap(wineSnapshot.data() as Map<String, dynamic>, wineId));
      }
    }

    // Update the state with the fetched wines
    if (mounted) {
      setState(() {
        allWines = fetchedWines;
        applyFilters(); // Apply filters initially
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: const Text('My Wishlist'),
          toolbarHeight: 30),
      body: Column(
        children: [
          //const SizedBox(height: 50,),
          _buildSearchBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Filters',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              IconButton(
                icon: Icon(
                    filtersVisible ? Icons.expand_less : Icons.expand_more),
                onPressed: () =>
                    setState(() => filtersVisible = !filtersVisible),
              ),
            ],
          ),
          if (filtersVisible) _buildFilters(),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          // Update the search query variable
          searchQuery = value;
        },
        onSubmitted: (value) {
          // Apply filters when Enter key is pressed
          applyFilters();
        },
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: filteredWines.length, // Use 'filteredWines' for itemCount
      itemBuilder: (context, index) {
        final wine = filteredWines[index]; // Use 'filteredWines' for list items
        return WineCardSearch(
          key: ObjectKey(wine), // Unique key for each WineCardSearch
          wineDetails: wine,
          userID: widget.userID,
          onWishlistChanged: updateWishlist,
          onUpdateRating: () {refreshWines();},
        );
      },
    );
  }

  Widget _buildFilters() {
    return Column(
      children: [
        // Toggle buttons for wine types
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButtonRow(),
            ElevatedButton(
              onPressed: applyFilters,
              style: ElevatedButton.styleFrom(
                elevation: 4, // Adjust the elevation as needed
                //padding: EdgeInsets.all(12), // Adjust the padding as needed
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Apply', style: TextStyle(fontSize: 14)),
                  ), // Adjust the font size as needed
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Filters', style: TextStyle(fontSize: 14)),
                  ), // Adjust the font size as needed
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'Minimum SavorSip Rating',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        // Slider for minimum rating
        _buildSliderForMinimumRating(),
        const Text(
          'Minimum No. of Ratings',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        // Slider for minimum number of reviews
        _buildSliderForMinimumNumberOfReviews(),
        // Checkbox for "Only Show Wines I have rated"
        _buildShowOnlyMyRatingsCheckbox(),
        // Apply Filters button
      ],
    );
  }

// Implement _buildButtonRow, _buildSliderForMinimumRating, _buildSliderForMinimumNumberOfReviews, and _buildShowOnlyMyRatingsCheckbox methods similar to your previous code
  Widget _buildButtonRow() {
    return ToggleButtons(
      isSelected: isSelectedType,
      onPressed: (int index) {
        setState(() {
          isSelectedType[index] = !isSelectedType[index];
          // Add your search filter logic here based on the state of isSelected
        });
      },
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            8,
            16,
            8,
          ),
          child: Column(
            children: [
              Text('Red'),
              Text('Wines'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            8,
            16,
            8,
          ),
          child: Column(
            children: [
              Text('Rosé'),
              Text('Wines'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            8,
            16,
            8,
          ),
          child: Column(
            children: [
              Text('White'),
              Text('Wines'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSliderForMinimumRating() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Slider(
        value: sliderValueMinRating,
        min: 0,
        max: 5,
        divisions: 10,
        label: sliderValueMinRating.toStringAsFixed(1),
        onChanged: (double value) {
          setState(() {
            sliderValueMinRating = value;
            applyFilters();
          });
        },
      ),
    );
  }

  Widget _buildSliderForMinimumNumberOfReviews() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Slider(
        value: sliderValueMinRatingCount,
        min: 0,
        max: 100,
        divisions: 20,
        label: sliderValueMinRatingCount.toStringAsFixed(0),
        onChanged: (double value) {
          setState(() {
            sliderValueMinRatingCount = value;
            applyFilters();
          });
        },
      ),
    );
  }

  Widget _buildShowOnlyMyRatingsCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: showOnlyMyRatings,
          onChanged: (bool? newValue) {
            setState(() {
              showOnlyMyRatings = newValue!;
              applyFilters();
            });
          },
        ),
        const Text("Only Show Wines I have rated"),
      ],
    );
  }

  void applyFilters() async {
    List<Wine> tempFilteredWines = allWines.where((wine) {
      return wine.wineName.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    if (showOnlyMyRatings) {
      var userRatedWines = await Rating.listRatings(widget.userID);
      Set<String> userRatedWineIds = userRatedWines
          .map((rating) => rating['wineDetails']['wid'] as String)
          .toSet();

      tempFilteredWines = tempFilteredWines
          .where((wine) => userRatedWineIds.contains(wine.wid))
          .toList();
    }

    tempFilteredWines = tempFilteredWines.where((wine) {
      bool matchesType = isSelectedType[0] && wine.wineType == 'Red' ||
          isSelectedType[1] && wine.wineType == 'Rose' ||
          isSelectedType[2] && wine.wineType == 'White' ||
          isSelectedType.every((element) => element);
      bool matchesRating = wine.wineRating >= sliderValueMinRating;
      bool matchesRatingCount = wine.numOfRatings >= sliderValueMinRatingCount;

      return matchesType && matchesRating && matchesRatingCount;
    }).toList();

    if (mounted) {
      setState(() {
        filteredWines = tempFilteredWines;
      });
    }
  }
}
