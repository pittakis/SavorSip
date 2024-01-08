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

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        isThreeLine: true,
        onTap: () {},
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: profilePicture,
          ),
        ),
        title: Row(
          children: [
            Text(
              "$firstName $lastName",
              style: const TextStyle(fontSize: 18,),
            ),
            if (userBadge != null) userBadge, // Display badge if not null
          ],
        ),
        subtitle: Text(
          userName,
          style: const TextStyle( fontSize: 14, color: Color.fromARGB(255, 124, 112, 112) )
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
    return const Icon(Icons.check_circle, color: Color.fromARGB(255, 81, 146, 203));
  } else {
    return null;
  }
}