import 'package:flutter/material.dart';
import 'package:savorsip/Models/users.dart';

Image genericProfilePicture = Image.asset('savorsip/assets/images/logo.PNG');
List<Users> potentialFriendList = [
  Users(
    uid: '1',
    firstName: 'John',
    lastName: 'Doe',
    username: 'john_doe',
    email: 'john@example.com',
    numOfRatings: 10,
    profilePic: '',
  ),
  Users(
    uid: '2',
    firstName: 'Jane',
    lastName: 'Doe',
    username: 'jane_doe',
    email: 'jane@example.com',
    numOfRatings: 15,
    profilePic: '',
  ),
  Users(
    uid: '3',
    firstName: 'Alice',
    lastName: 'Smith',
    username: 'alice_smith',
    email: 'alice@example.com',
    numOfRatings: 20,
    profilePic: '',
  ),
  Users(
    uid: '4',
    firstName: 'Bob',
    lastName: 'Johnson',
    username: 'bob_johnson',
    email: 'bob@example.com',
    numOfRatings: 5,
    profilePic: '',
  ),
  Users(
    uid: '5',
    firstName: 'Eve',
    lastName: 'Taylor',
    username: 'eve_taylor',
    email: 'eve@example.com',
    numOfRatings: 8,
    profilePic: '',
  ),
  Users(
    uid: '1',
    firstName: 'John',
    lastName: 'Doe',
    username: 'john_doe',
    email: 'john@example.com',
    numOfRatings: 10,
    profilePic: '',
  ),
  Users(
    uid: '2',
    firstName: 'Jane',
    lastName: 'Doe',
    username: 'jane_doe',
    email: 'jane@example.com',
    numOfRatings: 15,
    profilePic: '',
  ),
  Users(
    uid: '3',
    firstName: 'Alice',
    lastName: 'Smith',
    username: 'alice_smith',
    email: 'alice@example.com',
    numOfRatings: 20,
    profilePic: '',
  ),
  Users(
    uid: '4',
    firstName: 'Bob',
    lastName: 'Johnson',
    username: 'bob_johnson',
    email: 'bob@example.com',
    numOfRatings: 5,
    profilePic: '',
  ),
  Users(
    uid: '5',
    firstName: 'Eve',
    lastName: 'Taylor',
    username: 'eve_taylor',
    email: 'eve@example.com',
    numOfRatings: 8,
    profilePic: '',
  ),
];

class AddFriendsScreen extends StatefulWidget {
  final String userID;
  const AddFriendsScreen({super.key, required this.userID});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Friends')),
        body: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: potentialFriendList.length,
                itemBuilder: (context, index) {
                  final item = potentialFriendList[index];
                  return _generateTile(item, index);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: ClipOval(
        child: Material(
          color: Colors.purple, // Button color
          child: InkWell(
            onTap: () {
              // Action to be performed when the FAB is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddFriendsScreen(userID: widget.userID,)), // Replace MyRatingsScreen with your actual screen
              );
            },
            child: const SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                Icons.qr_code_2,
                color: Colors.white, // Icon color
              ),
            ),
          ),
        ),
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
          print("user typed $value");
          // Update the state based on the search input
        },
      ),
    );
  }

  Widget _generateTile(Users potentialFriend, int index) {
    //Icon? userBadge = getBadgeIcon(userFriend.leaderboardPosition);
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: genericProfilePicture.image,
      ),
      title: Row(
        children: [
          Text(
            '${potentialFriend.firstName} ${potentialFriend.lastName}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          //if (userBadge != null) userBadge, // Display badge if not null
          const Icon(Icons.wine_bar),
        ],
      ),
      subtitle: Text(potentialFriend.username,
          style: const TextStyle(
              fontSize: 14, color: Color.fromARGB(255, 124, 112, 112))),
      trailing: IconButton(
          onPressed: () {
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
