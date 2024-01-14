// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:savorsip/Models/leaderboard.dart';
import 'package:savorsip/Models/rating.dart';
import 'package:savorsip/Models/users.dart';
//import 'package:savorsip/components/components.dart';
import 'package:savorsip/components/WineCardHome.dart';


class CellarScreen extends StatefulWidget {
  final String userID;
  const CellarScreen({Key? key, required this.userID}) : super(key: key);

  @override
  _CellarScreenState createState() => _CellarScreenState();
}

class _CellarScreenState extends State<CellarScreen> {
  late Future<List<Rating>> myfriendsRatings;
  late Future<List<Map<String, dynamic>>> leaderboard;
  
  
  @override
  void initState() {
    super.initState();
    myfriendsRatings = Rating.fetchFriendsRatings(widget.userID);
    leaderboard = LeaderboardService.getLeaderboard();
  }
  

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      appBar: AppBar(title: const Text("Cellar")),
      body: Column(
        children: [
          const Text('Swipe right for the leaderboard', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),),
          Expanded(
            child: FutureBuilder<List<Rating>>(
              future: myfriendsRatings,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No ratings found"));
                } else {
                  snapshot.data!.sort((a, b) => b.ratingTime.compareTo(a.ratingTime));
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Rating currentRating = snapshot.data![index];
                      return WineCardHome(rating: currentRating);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 16),
              alignment: Alignment.center,
              child: const  Text(
                'Who is More Of a Drunk ?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: leaderboard,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text("No leaderboard data"));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var leaderboardEntry = snapshot.data![index];
                        return FutureBuilder<Users>(
                          future: Users.fetchUserData(leaderboardEntry['userId']),
                          builder: (context, userSnapshot) {
                            if (userSnapshot.connectionState == ConnectionState.waiting) {
                              return const ListTile(title: Text('Loading...'));
                            } else if (userSnapshot.hasError || !userSnapshot.hasData) {
                              return const ListTile(title: Text('User not found'));
                            } else {
                              return _generateFriendTile(
                                userSnapshot.data!, 
                                index, 
                                leaderboardEntry['numberOfRating']
                              );
                            }
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _generateFriendTile(Users userFriend, int index, int numberOfRatings) {
  ImageProvider<Object> backgroundImage;

  if (Uri.tryParse(userFriend.profilePic)?.isAbsolute ?? false) {
    backgroundImage = NetworkImage(userFriend.profilePic);
  } else {
    backgroundImage = AssetImage(userFriend.profilePic);
  }

  Color? textColor;
  switch (index) {
    case 0:
      textColor = const Color(0xFFFFD700); // Gold color for the first place
      break;
    case 1:
      textColor = const Color(0xFFC0C0C0); // Silver color for the second place
      break;
    case 2:
      textColor = const Color(0xFFCD7F32); // Bronze color for the third place
      break;
  }

  return ListTile(
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    leading: CircleAvatar(
      radius: 25,
      backgroundImage: backgroundImage,
    ),
    title: Text(
      '${userFriend.firstName} ${userFriend.lastName}',
      style: const TextStyle(fontSize: 18),
    ),
    subtitle: Text(
      userFriend.username,
      style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 124, 112, 112)),
    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '#${index + 1}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
        ),
        Text('$numberOfRatings') // Display just the number of ratings
      ],
    ),
  );
}
}