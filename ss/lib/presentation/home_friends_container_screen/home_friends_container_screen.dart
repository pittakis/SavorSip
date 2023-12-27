import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/presentation/community_friends_dark_tab_container_page/community_friends_dark_tab_container_page.dart';
import 'package:savorsipv2/presentation/home_friends_tab_container_page/home_friends_tab_container_page.dart';
import 'package:savorsipv2/presentation/profile_page/profile_page.dart';
import 'package:savorsipv2/presentation/search_page/search_page.dart';
import 'package:savorsipv2/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class HomeFriendsContainerScreen extends StatelessWidget {
  HomeFriendsContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.homeFriendsTabContainerPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Cellariconprimary:
        return AppRoutes.homeFriendsTabContainerPage;
      case BottomBarEnum.Search:
        return AppRoutes.communityFriendsDarkTabContainerPage;
      case BottomBarEnum.Searchwhitea700:
        return AppRoutes.searchPage;
      case BottomBarEnum.Lock:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homeFriendsTabContainerPage:
        return HomeFriendsTabContainerPage();
      case AppRoutes.communityFriendsDarkTabContainerPage:
        return CommunityFriendsDarkTabContainerPage();
      case AppRoutes.searchPage:
        return SearchPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      default:
        return DefaultWidget();
    }
  }
}
