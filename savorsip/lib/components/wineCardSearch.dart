import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:savorsip/Models/Wines.dart';

class WineCardSearch extends StatefulWidget {
  final Wine wineDetails;
  final Function(double) onRate;
  

  const WineCardSearch({super.key, required this.wineDetails, required this.onRate});

  @override
  _WineCardSearchState createState() => _WineCardSearchState();
}

class _WineCardSearchState extends State<WineCardSearch> {
  bool isExpanded = false;
  double sliderValue = 1;

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(widget.wineDetails.wineDescription),
                ),
                TextButton(
                  onPressed: ()=>_showRatingDialog(context),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, size: 20),
                      Text('Rate', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    ],
                  )
                )
              ],
            ),
        ],
      ),
    );
  }
 void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Text('Insert your rating'),
              Icon(Icons.star, color: Colors.amber),
            ],
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Slider(
                    value: sliderValue,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: '${sliderValue.toStringAsFixed(1)}/5',
                    thumbColor: Colors.amber,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      setState(() => sliderValue = value);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          widget.onRate(sliderValue);
                          // Handle the 'Save' action here
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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