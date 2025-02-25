// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:savorsip/Models/leaderboard.dart';
import 'package:savorsip/Models/users.dart';
import 'package:savorsip/components/color_schemes.dart';
import 'package:savorsip/screens/authentication/login.dart';
import 'package:savorsip/screens/secondary/edit_profile.dart';
import 'package:savorsip/screens/secondary/map_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:savorsip/screens/secondary/wishlist.dart';
import 'package:savorsip/theme_notifier.dart';

class ProfileScreen extends StatefulWidget {
  final String userID;
  const ProfileScreen({Key? key, required this.userID}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Users? currentUser; // Local variable to hold the updated user data
  int userPosition = -1; // Initialize with a default value
  bool isLightMode = true;

  @override
  void initState() {
    super.initState();
    isLightMode = Provider.of<ThemeProvider>(context, listen: false).isLightMode;
    _fetchAndSetCurrentUser();
    _fetchUserPosition();
  }

  Future<void> _fetchUserPosition() async {
    int position = await LeaderboardService.getUserPosition(widget.userID);
    if (mounted) {
      setState(() {
        userPosition = position;
      });
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
      //print("Error fetching user data: $e");
    }
  }

//sign Out Function
  void signMeOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const Login()), //here we can add the newUser ass parameter
    );
  }

  void navigateToWishlistScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WishlistScreen(
                userID: widget.userID,
              )), // Replace MyRatingsScreen with your actual screen
    );
  }

  void navigateToMapScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MapScreen(
                userID: widget.userID,
              )), // Replace MyRatingsScreen with your actual screen
    );
  }

  void navigateToEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditProfileScreen(
                userID: widget.userID,
              )), // Replace MyRatingsScreen with your actual screen
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        backgroundColor: theme.colorScheme.surface,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (currentUser != null) // Check if currentUser is not null
                _generateMyProfile(
                  currentUser!.firstName,
                  currentUser!.lastName,
                  currentUser!.username,
                  currentUser!.numOfRatings,
                  userPosition,
                  currentUser!.profilePic,
                  widget.userID,
                )
              else
                const CircularProgressIndicator(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                 
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,5,50,5),
                    child: _generateButton(
                        "Edit Profile ", theme.colorScheme.secondaryContainer,theme.colorScheme.onSecondaryContainer, Icons.edit_note, () {
                      navigateToEditProfileScreen(
                          context); // Pass the context parameter
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,5,50,5),
                    child: _generateButton(
                        "Wishlist ", theme.colorScheme.secondaryContainer, theme.colorScheme.onSecondaryContainer, Icons.bookmark_added, () {
                      navigateToWishlistScreen(
                          context); // Pass the context parameter
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50,5,50,5),
                    child: _generateButton("My Locations ",theme.colorScheme.secondaryContainer,theme.colorScheme.onSecondaryContainer,
                        Icons.location_on_outlined, () {
                      navigateToMapScreen(context); // Pass the context parameter
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.wb_sunny_outlined, size: 20,),
                          Switch(
                            value: !isLightMode,
                            onChanged: (value) {
                              setState(() {
                                isLightMode = !value;
                              });
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .toggleTheme();
                            },
                            activeColor: theme.colorScheme.primary,
                            inactiveThumbColor: theme.colorScheme.onSurface,
                            inactiveTrackColor:
                                theme.colorScheme.onSurface.withOpacity(0.5),
                          ),
                          const Icon(Icons.dark_mode_outlined, size: 20,)
                        ],
                      ),
                      /*
                      IconButton(
                        icon: const Icon(Icons.brightness_6),
                        onPressed: () =>
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleTheme(),
                      ),*/
                      ElevatedButton(
                          onPressed: () {
                            signMeOut();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.error,
                              elevation: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sign Out  ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: theme.colorScheme.onError,
                                  )),
                              Icon(Icons.exit_to_app,
                                  color: theme.colorScheme.onError,
                                  size: 16),
                            ],
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

Widget _generateMyProfile(
    String myFirstName,
    String myLastName,
    String myUserName,
    int myNumOfReviews,
    int myPosition,
    String myProfilePicUrl,
    String userID) {
  ImageProvider<Object> profileImage;
  if (Uri.tryParse(myProfilePicUrl)?.hasAbsolutePath ?? false) {
    // If the string can be parsed as a URL and has an absolute path, use NetworkImage
    profileImage = NetworkImage(myProfilePicUrl);
  } else {
    // Otherwise, assume it's an asset and use AssetImage
    profileImage = AssetImage(myProfilePicUrl);
  }

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 16, 16, 8),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: profileImage,
          ),
          title: Row(
            children: [
              Text(
                "$myFirstName $myLastName ",
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          subtitle: Text(myUserName,
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 124, 112, 112))),
        ),
        const Divider(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text("Total Reviews:", style: TextStyle(fontSize: 16)),
                Text("$myNumOfReviews", style: const TextStyle(fontSize: 24)),
              ],
            ),
            Column(
              children: [
                const Text("Rank:", style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    if (myPosition > 0)
                      Text("$myPosition", style: const TextStyle(fontSize: 24)),
                    if (getBadgeIcon(myPosition) != null)
                      getBadgeIcon(myPosition)!,
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
          child: Container(
            color: Colors.white,
            child: QrImageView(
              data: userID,
              version: QrVersions.auto,
              size: 200.0,
              gapless: false,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _generateButton(String textLabel, Color buttonColor, Color textColor, IconData buttonIcon,
    Function handlePressing) {
  //Prepei na prosthesoume onPressedFunction
  return ElevatedButton(
      onPressed: () {
        handlePressing();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, elevation: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textLabel,
              style: TextStyle(fontSize: 20, color: textColor,)),
          Icon(buttonIcon, color: textColor),
        ],
      ));
}

Icon? getBadgeIcon(int position) {
  if (position == 1) {
    return const Icon(Icons.wine_bar_sharp, color: Colors.amber);
  } else if (position == 2) {
    return const Icon(Icons.wine_bar_sharp,
        color: Color.fromARGB(255, 117, 116, 114));
  } else if (position == 3) {
    return const Icon(Icons.wine_bar_sharp,
        color: Color.fromARGB(255, 166, 102, 72));
  } else if (position <= 20) {
    return Icon(Icons.check_circle, color: lightColorScheme.primary);
  } else {
    return null;
  }
}
