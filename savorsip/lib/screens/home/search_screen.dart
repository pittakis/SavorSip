//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/Wines.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/components/components.dart';
import 'package:savorsip/components/wineCardSearch.dart';

List<Wine> WineList = [
  Wine(
      wid: '1',
      wineName: 'Chateau Margaux',
      numOfRatings: 120,
      wineRating: 4.2,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'Slimey yet Satisfying with a rich aftertaste like mr Koniaris',
      wineType: 'Red'),
  Wine(
      wid: '2',
      wineName: 'Screaming Eagle Cabernet 2012',
      numOfRatings: 80,
      wineRating: 4.6,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
      wineType: 'Red'),
  Wine(
      wid: '3',
      wineName: 'Moschato',
      numOfRatings: 30,
      wineRating: 4.1,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
      wineType: 'Rose'),
  Wine(
      wid: '4',
      wineName: 'Leonidas',
      numOfRatings: 53,
      wineRating: 4.9,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
      wineType: 'White'),
  Wine(
      wid: '5',
      wineName: 'Screaming Elephant Cabernet 2002',
      numOfRatings: 33,
      wineRating: 3.8,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
      wineType: 'White')
];

class SearchScreen extends StatefulWidget {
  final String userID;
  const SearchScreen({super.key, required this.userID});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double _sliderValue1 = 0;
  double _sliderValue2 = 0;
  List<bool> isSelected = [
    true,
    true,
    true,
  ];
  bool filtersVisible = false;
  bool showOnlyMyRatings = false;

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
                onPressed: () =>
                    setState(() => filtersVisible = !filtersVisible),
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
    // Use ListView or ListView.builder
    return ListView.builder(
        itemCount: WineList.length,
        itemBuilder: (context, index) {
          final wine = WineList[index];
          final winecard = WineCardSearch(
              wineDetails: wine,
              onRate: (double rrr) {
                setState(() {
                  print("Saved rating $rrr for wine ${wine.wineName}");
                  //WineList.removeAt(index);
                  // Logic to handle the rating action
                  // This could involve removing the wine, updating its rating, etc.
                });
              });
            return winecard;
        });
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
