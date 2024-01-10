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
      wineDescription: 'hey',
    ),
    Wine(
      wid: '2',
      wineName: 'Screaming Eagle Cabernet 2012',
      numOfRatings: 80,
      wineRating: 4.6,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
    ),
    Wine(
      wid: '3',
      wineName: 'Moschato',
      numOfRatings: 30,
      wineRating: 4.1,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
    ),
    Wine(
      wid: '4',
      wineName: 'Leonidas',
      numOfRatings: 53,
      wineRating: 4.9,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
    ),
    Wine(
      wid: '5',
      wineName: 'Screaming Elephant Cabernet 2002',
      numOfRatings: 33,
      wineRating: 3.8,
      winePic: 'https://via.placeholder.com/150',
      wineDescription: 'hey',
    )
  ];

class SearchScreen extends StatefulWidget {
  final String userID;
  const SearchScreen({super.key, required this.userID});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

 double _sliderValue = 0;
 List<bool> isSelected = [true, true, true,];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildButtonRow(),
          _buildSlider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
            child: Text(
              "Adjust the slider to select minimum rating",
              style:TextStyle( fontSize: 10, color: Colors.grey[700])
            ),
          ),
          Expanded(child: _buildList()),
        ],
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
  
  Widget _buildSlider() {
  return Slider(
    value: _sliderValue,
    min: 0,
    max: 4.5,
    divisions: 9,
    label: _sliderValue.toStringAsFixed(1),
    onChanged: (double value) {
      print("Slider bar set to $value");
      setState(() {
        _sliderValue = value;
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
          return WineCardSearch( wineDetails: wine,onRate: (double rrr) {
    setState(() {
      print("Saved rating $rrr for wine ${wine.wineName}");
      //WineList.removeAt(index);
      // Logic to handle the rating action
      // This could involve removing the wine, updating its rating, etc.
    });
        });
        }
      );
  }


  

}


Icon? getBadgeIcon(int position) {
  if (position == 1) {
    return const Icon(Icons.wine_bar_sharp, color: Colors.amber);
  } else if (position == 2) {
    return const Icon(Icons.wine_bar_sharp, color: Color.fromARGB(255, 117, 116, 114));
  } else if (position == 3) {
    return const Icon(Icons.wine_bar_sharp, color: Color.fromARGB(255, 166, 102, 72));
  } else if (position<=20) {
    return const Icon(Icons.check_circle, color: Color.fromARGB(255, 203, 81, 81));
  } else {
    return null;
  }
}