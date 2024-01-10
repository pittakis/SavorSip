import 'package:flutter/material.dart';
import 'package:savorsip/Models/Wines.dart';

class WineCardSearch extends StatefulWidget {
  final Wine wineDetails;

  const WineCardSearch({super.key, required this.wineDetails});

  @override
  _WineCardSearchState createState() => _WineCardSearchState();
}

class _WineCardSearchState extends State<WineCardSearch> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(
                  widget.wineDetails.winePic,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.wineDetails.wineName,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text("${widget.wineDetails.wineRating} / 5   "),
                          Text("(${widget.wineDetails.numOfRatings})", style: const TextStyle(fontSize: 10),),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () => setState(() => isExpanded = !isExpanded),
                ),
              ],
            ),
          ),
          if (isExpanded)
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(widget.wineDetails.wineDescription),
            ),
        ],
      ),
    );
  }
}
