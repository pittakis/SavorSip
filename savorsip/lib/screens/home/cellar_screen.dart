import 'package:flutter/material.dart';
import 'package:savorsip/components/components.dart';

class CellarScreen extends StatelessWidget {
  const CellarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //_buildTopNavigation(),
            SizedBox(height: 10),
            WineCardHome(
              imageUrl: "https://via.placeholder.com/64x64",
              wineName: "Wine Name 1",
              venueName: "Venue Name 1",
              description: "Here will be the wine description 1",
              rating: 4.5,
              friendsRating: 4.2,
            ),
            SizedBox(height: 16),
            WineCardHome(
              imageUrl: "https://via.placeholder.com/64x64",
              wineName: "Wine Name 2",
              venueName: "Venue Name 2",
              description: "Here will be the wine description 2",
              rating: 4.3,
              friendsRating: 4.1,
            ),
            SizedBox(height: 10),
            //_buildBottomNavigation(),
          ],
        ),
      ),
    ); /*ListView.builder(
        itemCount: myWines.length ,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                isThreeLine: true,
                onTap: (){},
                title: Text(myWines[index].name),
                subtitle: Text(myWines[index].winemaker),
                trailing: Text('${myWines[index].year}'),
                leading: const Padding(
                  padding: EdgeInsets.fromLTRB(1, 8, 1, 0),
                  child: Icon(
                    Icons.wine_bar,
                    //opticalSize: 15.0,
                    color: Color.fromARGB(255, 151, 29, 185),
                    ),
                ),
              ),
            ),
          );
        }
      );*/
  }
}