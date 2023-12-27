import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/presentation/community_friends_dark_tab_container_page/community_friends_dark_tab_container_page.dart';
import 'package:savorsipv2/presentation/home_friends_tab_container_page/home_friends_tab_container_page.dart';
import 'package:savorsipv2/presentation/profile_page/profile_page.dart';
import 'package:savorsipv2/presentation/search_page/search_page.dart';
import 'package:savorsipv2/widgets/custom_bottom_bar.dart';
import 'package:savorsipv2/widgets/custom_drop_down.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';
import 'package:savorsipv2/widgets/custom_switch.dart';

class ProfileDarkScreen extends StatelessWidget {
  ProfileDarkScreen({Key? key})
      : super(
          key: key,
        );

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList1 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList2 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  List<String> dropdownItemList3 = [
    "Item One",
    "Item Two",
    "Item Three",
  ];

  bool isSelectedSwitch = false;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 65.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.v,
                ),
                decoration: AppDecoration.fillBlack,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70.v,
                              width: 65.h,
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgEllipse49,
                                    height: 64.adaptSize,
                                    width: 64.adaptSize,
                                    radius: BorderRadius.circular(
                                      32.h,
                                    ),
                                    alignment: Alignment.topCenter,
                                  ),
                                  CustomIconButton(
                                    height: 22.adaptSize,
                                    width: 22.adaptSize,
                                    padding: EdgeInsets.all(1.h),
                                    alignment: Alignment.bottomRight,
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgSettings,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 9.h,
                                top: 5.v,
                                bottom: 10.v,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Full name",
                                    style: CustomTextStyles.titleLargePrimary,
                                  ),
                                  SizedBox(height: 8.v),
                                  Text(
                                    "@username",
                                    style: CustomTextStyles.titleMediumPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 26.h),
                      decoration: AppDecoration.outlinePrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder8,
                      ),
                      child: DottedBorder(
                        color: theme.colorScheme.primary,
                        padding: EdgeInsets.only(
                          left: 2.h,
                          top: 2.v,
                          right: 2.h,
                          bottom: 2.v,
                        ),
                        strokeWidth: 2.h,
                        radius: Radius.circular(8),
                        borderType: BorderType.RRect,
                        dashPattern: [
                          2,
                          3,
                        ],
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.h,
                            vertical: 10.v,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Total Wine Reviews",
                                      style: CustomTextStyles.titleLargePrimary,
                                    ),
                                    SizedBox(height: 12.v),
                                    Text(
                                      "999",
                                      style: CustomTextStyles.titleLargePrimary,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.h,
                                  bottom: 3.v,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Rank",
                                      style: CustomTextStyles.titleLargePrimary,
                                    ),
                                    SizedBox(height: 11.v),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgClose,
                                      height: 24.v,
                                      width: 36.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    CustomDropDown(
                      icon: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrowdownOnprimary16x16,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                      ),
                      hintText: "Edit Profile",
                      items: dropdownItemList,
                      borderDecoration: DropDownStyleHelper.fillPrimary,
                      fillColor: theme.colorScheme.primary,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 15.v),
                    CustomDropDown(
                      icon: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrowdownOnprimary16x16,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                      ),
                      hintText: "My Locations",
                      items: dropdownItemList1,
                      borderDecoration: DropDownStyleHelper.fillPrimary,
                      fillColor: theme.colorScheme.primary,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 15.v),
                    CustomDropDown(
                      icon: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrowdownOnprimary16x16,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                      ),
                      hintText: "My Ratings",
                      items: dropdownItemList2,
                      borderDecoration: DropDownStyleHelper.fillPrimary,
                      fillColor: theme.colorScheme.primary,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 15.v),
                    CustomDropDown(
                      icon: Container(
                        margin: EdgeInsets.fromLTRB(30.h, 12.v, 12.h, 12.v),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgArrowdownOnprimary16x16,
                          height: 16.adaptSize,
                          width: 16.adaptSize,
                        ),
                      ),
                      hintText: "Wishlist",
                      items: dropdownItemList3,
                      borderDecoration: DropDownStyleHelper.fillPrimary,
                      fillColor: theme.colorScheme.primary,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 15.v),
                    _buildUserProfileSection(context),
                    SizedBox(height: 20.v),
                    Container(
                      height: 212.v,
                      width: 202.h,
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.roundedBorder25,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgRectangle41192x182,
                        height: 192.v,
                        width: 182.h,
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBarSection(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11.v),
            child: Text(
              "Dark Mode",
              style: CustomTextStyles.titleSmallPrimary,
            ),
          ),
          CustomSwitch(
            margin: EdgeInsets.only(
              left: 10.h,
              top: 4.v,
              bottom: 4.v,
            ),
            value: isSelectedSwitch,
            onChange: (value) {
              isSelectedSwitch = value;
            },
          ),
          Spacer(),
          CustomElevatedButton(
            width: 103.h,
            text: "Sign Out",
            buttonStyle: CustomButtonStyles.fillDeepPurple,
            buttonTextStyle: CustomTextStyles.titleSmallBlack900,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
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
