import 'package:flutter/material.dart';
import 'package:savorsip/Models/Wines.dart';
import 'package:savorsip/Models/rating.dart';
import 'package:savorsip/Models/users.dart';
import 'package:intl/intl.dart';
import 'package:savorsip/components/color_schemes.dart';

class WineCardHome extends StatelessWidget {
  final Rating rating;
  

  const WineCardHome({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Users>(
      future: Users.fetchUserData(rating.uid),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
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
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _generateFriendTile(user, context),
            const SizedBox(height: 10),
            _buildHeader(wine1.winePic, wine1.wineName, wine1.wineDescription, context),
            const SizedBox(height: 10),
            if (rating.city != null && rating.country != null)
              Text(
                '${rating.city!}, ${rating.country!}',
                style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            Text(
              DateFormat('dd-MM-yyyy').format(rating.ratingTime),
              style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            _buildRatings("${user.firstName} rated:", rating.ratingOftheUser, theme.colorScheme.primary, context),
            const SizedBox(height: 5),
            _buildRatings("SS Rating:", wine1.wineRating, theme.colorScheme.primary, context),
          ],
        ),
      ),
    );
  }

Widget _buildHeader(String imageUrl, String wineName, String description, BuildContext context) {
  var theme = Theme.of(context);

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
                style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                "'$description'",
                style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatings(String title, double rating, Color textColor, BuildContext context) {
  var theme = Theme.of(context);
    return Row(
      children: [
        Text(title,
            style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
        const SizedBox(width: 10),
        Row(
          children: [
            Icon(Icons.star, color: textColor, size: 22),
            Text(
              '${rating.toStringAsFixed(1)}/5',
              style:  TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  Widget _generateFriendTile(Users userFriend, BuildContext context) {
  var theme = Theme.of(context);
    ImageProvider<Object> profileImage;
    if (userFriend.profilePic.isNotEmpty &&
        Uri.tryParse(userFriend.profilePic)?.isAbsolute == true) {
      profileImage = NetworkImage(userFriend.profilePic);
    } else {
      profileImage = AssetImage(userFriend.profilePic);
    }
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: profileImage,
      ),
      title: Row(
        children: [
          Text(
            '${userFriend.firstName} ${userFriend.lastName}',
            style: TextStyle(fontSize: 18, color: theme.colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 5),
          //const Icon(Icons.wine_bar, color: Colors.white),
        ],
      ),
      subtitle: Text(userFriend.username,
          style: TextStyle(fontSize: 14, color: theme.colorScheme.onSurfaceVariant)),
    );
  }
}
