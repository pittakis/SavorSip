import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/Wines.dart';
import 'package:savorsip/components/wineCardSearch.dart';

class SearchScreen extends StatefulWidget {
  final String userID;
  const SearchScreen({super.key, required this.userID});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Wine> allWines = []; // List to store all fetched wines
  List<Wine> filteredWines = []; // List to store filtered wines
  double _sliderValue1 = 0;
  double _sliderValue2 = 0;
  List<bool> isSelected = [true, true, true]; // Red, Rose, White
  bool filtersVisible = false;
  bool showOnlyMyRatings = false;

  @override
  void initState() {
    super.initState();
    fetchWines();
  }

  Future<void> fetchWines() async {
    QuerySnapshot wineSnapshot = await FirebaseFirestore.instance.collection('Wines').get();
    List<Wine> fetchedWines = wineSnapshot.docs.map((doc) => Wine.fromMap(doc.data() as Map<String, dynamic>, doc.id)).toList();
    setState(() {
      allWines = fetchedWines;
      applyFilters();
    });
  }

  void applyFilters() async{
    List<Wine> tempWines = allWines;

  if (showOnlyMyRatings) {
    // Fetch user's ratings from Firestore
    var userRatingsSnapshot = await FirebaseFirestore.instance
        .collection('Ratings') // Assuming 'UserRatings' is the collection name
        .where('uid', isEqualTo: widget.userID)
        .get();

    var userRatedWineIds = userRatingsSnapshot.docs.map((doc) => doc.data()['wid'] as String).toSet();

    // Filter wines to include only those that the user has rated
    tempWines = tempWines.where((wine) => userRatedWineIds.contains(wine.wid)).toList();
  }

    // Filter by wine type
    if (!isSelected[0]) tempWines = tempWines.where((wine) => wine.wineType != 'Red').toList();
    if (!isSelected[1]) tempWines = tempWines.where((wine) => wine.wineType != 'Rose').toList();
    if (!isSelected[2]) tempWines = tempWines.where((wine) => wine.wineType != 'White').toList();

    // Filter by rating and number of ratings
  tempWines = tempWines.where((wine) => wine.wineRating >= _sliderValue1 && wine.numOfRatings >= _sliderValue2).toList();

  setState(() => filteredWines = tempWines);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Filters',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              IconButton(
                icon: Icon(
                  filtersVisible ? Icons.expand_less : Icons.expand_more),
                onPressed: () => setState(() => filtersVisible = !filtersVisible),
              ),
            ],
          ),
          if (filtersVisible) 
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value:
                          showOnlyMyRatings, // Maintain a boolean variable for the checkbox state
                      onChanged: (value) {
                        setState(() {
                          showOnlyMyRatings = value!;
                          if (showOnlyMyRatings) {
                            print("Only show my ratings");

                          } else {
                            print('Show all');
                          }
                        });
                      },
                    ),
                    const Text("Only Show Wines I have rated"),
                  ],
                ),
                _buildButtonRow(),
                _buildSliderForMinimumRating(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: Text("Adjust the slider to select minimum rating",
                      style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                ),
                _buildSliderForMinimumNumberOfReviews(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: Text(
                      "Adjust the slider to select the minimum number of user ratings",
                      style: TextStyle(fontSize: 10, color: Colors.grey[700])),
                ),
                 ElevatedButton(
                  onPressed: () {
                    applyFilters(); // Call the applyFilters method when the button is pressed
                    setState(() => filtersVisible = !filtersVisible);
                  },
                  child: const Text('Apply Filters'),
                ),
              ],
            ),
          Expanded(child: _buildList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("barcode reader");
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.barcode_reader,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          print("user typed $value");
          // Update the state based on the search input
        },
      ),
    );
  }

  Widget _buildButtonRow() {
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int index) {
        setState(() {
          isSelected[index] = !isSelected[index];
          // Add your search filter logic here based on the state of isSelected
        });
      },
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Red Wines'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Rosé Wines'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('White Wines'),
        ),
      ],
    );
  }

  Widget _buildSliderForMinimumRating() {
    return Slider(
      value: _sliderValue1,
      min: 0,
      max: 4.5,
      divisions: 9,
      label: _sliderValue1.toStringAsFixed(1),
      onChanged: (double value) {
        print("Slider bar set to $value");
        setState(() {
          _sliderValue1 = value;
        });
      },
    );
  }

  Widget _buildSliderForMinimumNumberOfReviews() {
    return Slider(
      value: _sliderValue2,
      min: 0,
      max: 100,
      divisions: 10,
      label: _sliderValue2.toStringAsFixed(1),
      onChanged: (double value) {
        print("Slider bar set to $value");
        setState(() {
          _sliderValue2 = value;
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: filteredWines.length, // Use 'filteredWines' for itemCount
      itemBuilder: (context, index) {
        final wine = filteredWines[index]; // Use 'filteredWines' for list items
        return WineCardSearch(
          wineDetails: wine,
          onRate: (double rating) {
            // Handle rating logic
            print("Saved rating $rating for wine ${wine.wineName}");
            //Update or add Rating
          },
          userID: widget.userID,
        );
      },
    );
  }
}

Icon? getBadgeIcon(int position) {
  if (position == 1) {
    return const Icon(Icons.wine_bar_sharp, color: Colors.amber);
  } else if (position == 2) {
    return const Icon(Icons.wine_bar_sharp,
        color: Color.fromARGB(255, 117, 116, 114));
  } else if (position == 3) {
    return const Icon(Icons.wine_bar_sharp,
        color: Color.fromARGB(255, 166, 102, 72));
  } else if (position <= 20) {
    return const Icon(Icons.check_circle,
        color: Color.fromARGB(255, 203, 81, 81));
  } else {
    return null;
  }
}