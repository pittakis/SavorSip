import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/screens/Tertiary/qr_scan_screen.dart';

Image genericProfilePicture = Image.asset('assets/images/logo.PNG');
List<Users> potentialFriendList = [];

class AddFriendsScreen extends StatefulWidget {
  final String userID;
  const AddFriendsScreen({super.key, required this.userID});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {

  Users? currentUser; // Local variable to hold the updated user data
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchPotentialFriends();
    _fetchAndSetCurrentUser();
  }

  Future<void> _fetchPotentialFriends() async {
    try {
      List<Users> fetchedPotentialFriends = await Users.fetchPotentialFriends(widget.userID);
      setState(() {
        potentialFriendList = fetchedPotentialFriends;
      });
    } catch (e) {
      // Handle errors
      print("Error fetching potential friends: $e");
    }
  }

  Future<void> _fetchAndSetCurrentUser() async {
    try {
      Users fetchedUser = await Users.fetchUserData(widget.userID);
      setState(() {
        currentUser = fetchedUser;
      });
    } catch (e) {
      // Handle errors, e.g., user not found or network issues
      print("Error fetching user data: $e");
    }
  }

  // Add this method to filter the potential friends based on the search query
  List<Users> _filterPotentialFriends() {
    return potentialFriendList
        .where((user) => user.username.toLowerCase().contains(searchQuery.toLowerCase()) ||
                         user.firstName.toLowerCase().contains(searchQuery.toLowerCase()) ||
                         user.lastName.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredFriendsList = _filterPotentialFriends();
    return Scaffold(
        appBar: AppBar(title: const Text('Add Friends')),
        body: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFriendsList.length,
                itemBuilder: (context, index) {
                  final item = filteredFriendsList[index];
                  return _generateTile(item, index);
                },
              ),
            ),
          ],
        ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => QRScanScreen(myUserID: widget.userID,)),
              );
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.qr_code_2_outlined, color: Colors.white,),
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
        setState(() {
          searchQuery = value;
        });
          print("user typed $value");
          // Update the state based on the search input
        },
      ),
    );
  }

  ImageProvider<Object> _getImageProvider(String imagePath) {
    // Check if imagePath is a URL for a network image
    if (Uri.tryParse(imagePath)?.hasAbsolutePath ?? false) {
      return NetworkImage(imagePath);
    } else {
      // If not a network image, return AssetImage
      return AssetImage(imagePath.isNotEmpty ? imagePath : 'assets/images/default_profile_pic.png');
    }
  }

  Widget _generateTile(Users potentialFriend, int index) {
    //Icon? userBadge = getBadgeIcon(userFriend.leaderboardPosition);
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: _getImageProvider(potentialFriend.profilePic),
      ),
      title: Row(
        children: [
          Text(
            '${potentialFriend.firstName} ${potentialFriend.lastName}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          //if (userBadge != null) userBadge, // Display badge if not null
          const Icon(Icons.wine_bar),
        ],
      ),
      subtitle: Text(potentialFriend.username,
          style: const TextStyle(
              fontSize: 12, color: Color.fromARGB(255, 124, 112, 112))),
      trailing: IconButton(
          onPressed: () {
            Users.sendFriendRequest(widget.userID, potentialFriend.uid);
            print('Friend Request Sent to ${potentialFriend.username}');
            setState(() {
              potentialFriendList.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text('Friend Request Sent to ${potentialFriend.username}'),
              ),
            );
          },
          icon: const Icon(Icons.person_add_alt)),
    );
  }
}
