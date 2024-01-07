import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String firstName;
  final String userName;
  final String lastName;
  //final Image profilePicture;
  final int leaderboardPosition;

  UserTile({super.key, 
    required this.firstName,
    required this.userName,
    required this.lastName,
    //required this.profilePicture,
    required this.leaderboardPosition,
  });

  @override
  Widget build(BuildContext context) {
    /*
    Icon? userBadge;
    switch (leaderboardPosition) {
      case 1:
        userBadge = const Icon(Icons.wine_bar_sharp,color: Colors.amber,); // Replace 'icon1' with the actual icon you want to use
        break;
      case 2:
        userBadge = const Icon(Icons.wine_bar_sharp,color: Color.fromARGB(255, 117, 116, 114),); // Replace 'icon2' with the actual icon you want to use
        break;
      case 3:
        userBadge = const Icon(Icons.wine_bar_sharp,color: Color.fromARGB(255, 166, 102, 72),); // Replace 'icon3' with the actual icon you want to use
        break;
      default:
        userBadge = null; // Set trailingIcon to null when 'num' doesn't match any case
    }*/
    return Expanded(
      child: ListTile(
        isThreeLine: true,
        onTap: (){},
        //leading: Image(image: profilePicture.image),
        title: Row(
          children: [
            Text("$firstName $lastName"),
            //Icon(userBadge as IconData?)
          ],
        ),
        subtitle: Text(userName),
        
      ),
    );
  }
}