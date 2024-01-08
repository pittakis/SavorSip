import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String firstName;
  final String userName;
  final String lastName;
  final Image profilePicture;
  final int leaderboardPosition;

  UserTile({super.key, 
    required this.firstName,
    required this.userName,
    required this.lastName,
    required this.profilePicture,
    required this.leaderboardPosition,
  });

  
  @override
  Widget build(BuildContext context) {
    Icon? userBadge = getBadgeIcon(leaderboardPosition);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple.shade300),
          borderRadius: BorderRadius.circular(1),
        ),
        child: ListTile(
          //contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          //onTap: () {},
          leading: CircleAvatar(
            radius: 25, // Adjust the radius as needed
            backgroundImage: profilePicture.image,
          ),

          title: Row(
            children: [
              Text(
                "$firstName $lastName ",
                style: const TextStyle(fontSize: 18,),
              ),
              if (userBadge != null) userBadge, // Display badge if not null
            ],
          ),
          subtitle: Text(userName,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 124, 112, 112))),
          trailing: IconButton(
            onPressed: () {
              print("delete friend");
            },
            icon: const Icon(Icons.delete_forever_rounded),
            iconSize: 20,
          ),
        ),
      ),
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