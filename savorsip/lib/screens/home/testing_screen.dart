import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/screens/secondary/pending_requests.dart';

class TestingScreen extends StatefulWidget {
  final Users currentUser;
  const TestingScreen({super.key, required this.currentUser});

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {

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
          Text(
            "Adjust the slider to select minimum rating",
            style:TextStyle( fontSize: 10, color: Colors.grey[700])
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
      setState(() {
        _sliderValue = value;
      });
    },
  );
}


  Widget _buildList() {
    // Use ListView or ListView.builder
    return ListView(
      children: [
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
      ],
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