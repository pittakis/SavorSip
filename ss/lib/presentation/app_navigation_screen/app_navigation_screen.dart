import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "MD3 Icons and Spare Parts",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.md3IconsAndSparePartsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SignUp",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signupScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.loginDarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "SignUp Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signupDarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home-Friends - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homeFriendsContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Search Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.searchDarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileDarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "QR",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.qrScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add Friends",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addFriendsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Edit profile",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Add Friends Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addFriendsDarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Edit profile Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editProfileDarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Camera",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.cameraScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "My Ratings",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myRatingsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "My Ratings Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.myRatingsDarkScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Maps",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.mapsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Wishlist",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.wishlistScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Wishlist Dark",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.wishlistDarkScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
