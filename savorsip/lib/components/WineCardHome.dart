import 'package:flutter/material.dart';
import 'package:savorsip/Models/Wines.dart';
import 'package:savorsip/Models/rating.dart';
import 'package:savorsip/Models/users.dart';
import 'package:intl/intl.dart';
import 'package:savorsip/components/colors.dart';

class WineCardHome extends StatelessWidget {
  final Rating rating;

  const WineCardHome({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Users>(
      future: Users.fetchUserData(rating.uid),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const  CircularProgressIndicator();
        } else if (userSnapshot.hasError) {
          return Text('Error: ${userSnapshot.error}');
        } else if (!userSnapshot.hasData) {
          return const Text('User not found');
        } else {
          Users user1 = userSnapshot.data!;
          return FutureBuilder<Wine?>(
            future: Wine.fetchWineByWid(rating.wid),
            builder: (context, wineSnapshot) {
              if (wineSnapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (wineSnapshot.hasError) {
                return Text('Error: ${wineSnapshot.error}');
              } else if (!wineSnapshot.hasData) {
                return const Text('Wine not found');
              } else {
                Wine wine1 = wineSnapshot.data!;
                return _buildCard(user1, wine1, context);
              }
            },
          );
        }
      },
    );
  }

  Widget _buildCard(Users user, Wine wine1, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _generateFriendTile(user),
            const SizedBox(height: 10),
            _buildHeader(wine1.winePic, wine1.wineName, wine1.wineDescription),
            const SizedBox(height: 10),
            if(rating.city!=null && rating.country!=null)
            Text('${rating.city!}, ${rating.country!}', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
            Text(DateFormat('dd-MM-yyyy').format(rating.ratingTime), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
            const SizedBox(height: 10),
            _buildRatings("${user.firstName} rated:", rating.ratingOftheUser),
            const SizedBox(height: 5),
            _buildRatings("SS Rating:", wine1.wineRating),
          ],
        ),
      ),
    );
  }

Widget _buildHeader(String imageUrl, String wineName, String description) {
  // Determine if the imageUrl is a network image or an asset image
  final ImageProvider imageProvider;
  if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {
    imageProvider = NetworkImage(imageUrl);
  } else {
    imageProvider = AssetImage(imageUrl);
  }

  return Row(
    children: [
      Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(width: 15),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              wineName,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              "'$description'",
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildRatings(String title, double rating) {
  return Row(
    children: [
      Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
      const SizedBox(width: 10),
      Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 22),
          Text(
            '${rating.toStringAsFixed(1)}/5',
            style: const TextStyle(color: Color(0xFFFFD700), fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ],
  );
}

Widget _generateFriendTile(Users userFriend) {
  ImageProvider<Object> profileImage;
  if (userFriend.profilePic.isNotEmpty && Uri.tryParse(userFriend.profilePic)?.isAbsolute == true) {
    profileImage = NetworkImage(userFriend.profilePic);
  } else {
    profileImage = AssetImage(userFriend.profilePic);
  }
  return ListTile(
    contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    leading: CircleAvatar(
      radius: 25,
      backgroundImage: profileImage,
    ),
    title: Row(
      children: [
        Text(
          '${userFriend.firstName} ${userFriend.lastName}',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(width: 5),
        //const Icon(Icons.wine_bar, color: Colors.white),
      ],
    ),
    subtitle: Text(userFriend.username, style: const TextStyle(fontSize: 14, color: Colors.grey)),
  );
}
}