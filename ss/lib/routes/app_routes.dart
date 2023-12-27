import 'package:flutter/material.dart';
import 'package:savorsipv2/presentation/login_screen/login_screen.dart';
import 'package:savorsipv2/presentation/md3_icons_and_spare_parts_screen/md3_icons_and_spare_parts_screen.dart';
import 'package:savorsipv2/presentation/signup_screen/signup_screen.dart';
import 'package:savorsipv2/presentation/login_dark_screen/login_dark_screen.dart';
import 'package:savorsipv2/presentation/signup_dark_screen/signup_dark_screen.dart';
import 'package:savorsipv2/presentation/home_friends_container_screen/home_friends_container_screen.dart';
import 'package:savorsipv2/presentation/search_dark_screen/search_dark_screen.dart';
import 'package:savorsipv2/presentation/profile_dark_screen/profile_dark_screen.dart';
import 'package:savorsipv2/presentation/qr_screen/qr_screen.dart';
import 'package:savorsipv2/presentation/add_friends_screen/add_friends_screen.dart';
import 'package:savorsipv2/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:savorsipv2/presentation/add_friends_dark_screen/add_friends_dark_screen.dart';
import 'package:savorsipv2/presentation/edit_profile_dark_screen/edit_profile_dark_screen.dart';
import 'package:savorsipv2/presentation/camera_screen/camera_screen.dart';
import 'package:savorsipv2/presentation/my_ratings_screen/my_ratings_screen.dart';
import 'package:savorsipv2/presentation/my_ratings_dark_screen/my_ratings_dark_screen.dart';
import 'package:savorsipv2/presentation/maps_screen/maps_screen.dart';
import 'package:savorsipv2/presentation/wishlist_screen/wishlist_screen.dart';
import 'package:savorsipv2/presentation/wishlist_dark_screen/wishlist_dark_screen.dart';
import 'package:savorsipv2/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String md3IconsAndSparePartsScreen =
      '/md3_icons_and_spare_parts_screen';

  static const String signupScreen = '/signup_screen';

  static const String loginDarkScreen = '/login_dark_screen';

  static const String signupDarkScreen = '/signup_dark_screen';

  static const String homeNearbyPage = '/home_nearby_page';

  static const String homeFriendsPage = '/home_friends_page';

  static const String homeFriendsTabContainerPage =
      '/home_friends_tab_container_page';

  static const String homeFriendsContainerScreen =
      '/home_friends_container_screen';

  static const String communityLeaderboardPage = '/community_leaderboard_page';

  static const String communityFriendsPage = '/community_friends_page';

  static const String searchPage = '/search_page';

  static const String profilePage = '/profile_page';

  static const String homeNearbyDarkPage = '/home_nearby_dark_page';

  static const String homeFriendsDarkPage = '/home_friends_dark_page';

  static const String communityLeaderboardDarkPage =
      '/community_leaderboard_dark_page';

  static const String communityFriendsDarkPage = '/community_friends_dark_page';

  static const String communityFriendsDarkTabContainerPage =
      '/community_friends_dark_tab_container_page';

  static const String searchDarkScreen = '/search_dark_screen';

  static const String profileDarkScreen = '/profile_dark_screen';

  static const String qrScreen = '/qr_screen';

  static const String addFriendsScreen = '/add_friends_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String addFriendsDarkScreen = '/add_friends_dark_screen';

  static const String editProfileDarkScreen = '/edit_profile_dark_screen';

  static const String cameraScreen = '/camera_screen';

  static const String myRatingsScreen = '/my_ratings_screen';

  static const String myRatingsDarkScreen = '/my_ratings_dark_screen';

  static const String mapsScreen = '/maps_screen';

  static const String wishlistScreen = '/wishlist_screen';

  static const String wishlistDarkScreen = '/wishlist_dark_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    md3IconsAndSparePartsScreen: (context) => Md3IconsAndSparePartsScreen(),
    signupScreen: (context) => SignupScreen(),
    loginDarkScreen: (context) => LoginDarkScreen(),
    signupDarkScreen: (context) => SignupDarkScreen(),
    homeFriendsContainerScreen: (context) => HomeFriendsContainerScreen(),
    searchDarkScreen: (context) => SearchDarkScreen(),
    profileDarkScreen: (context) => ProfileDarkScreen(),
    qrScreen: (context) => QrScreen(),
    addFriendsScreen: (context) => AddFriendsScreen(),
    editProfileScreen: (context) => EditProfileScreen(),
    addFriendsDarkScreen: (context) => AddFriendsDarkScreen(),
    editProfileDarkScreen: (context) => EditProfileDarkScreen(),
    cameraScreen: (context) => CameraScreen(),
    myRatingsScreen: (context) => MyRatingsScreen(),
    myRatingsDarkScreen: (context) => MyRatingsDarkScreen(),
    mapsScreen: (context) => MapsScreen(),
    wishlistScreen: (context) => WishlistScreen(),
    wishlistDarkScreen: (context) => WishlistDarkScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
