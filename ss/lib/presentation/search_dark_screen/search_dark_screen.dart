import '../search_dark_screen/widgets/filterchip_item_widget.dart';
import '../search_dark_screen/widgets/winecardinsearchlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/presentation/community_friends_dark_tab_container_page/community_friends_dark_tab_container_page.dart';
import 'package:savorsipv2/presentation/home_friends_tab_container_page/home_friends_tab_container_page.dart';
import 'package:savorsipv2/presentation/profile_page/profile_page.dart';
import 'package:savorsipv2/presentation/search_page/search_page.dart';
import 'package:savorsipv2/widgets/custom_bottom_bar.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';
import 'package:savorsipv2/widgets/custom_pin_code_text_field.dart';

class SearchDarkScreen extends StatelessWidget {
  SearchDarkScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10.h),
          decoration: AppDecoration.fillBlack,
          child: Column(
            children: [
              _buildSearchBarRow(context),
              SizedBox(height: 10.v),
              _buildChooseStyleColumn(context),
              SizedBox(height: 10.v),
              _buildMinimumRatingColumn(context),
              SizedBox(height: 10.v),
              _buildWineCardInSearchList(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBarColumn(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildSearchBarRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: AppDecoration.outlineBlack900.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillPrimary,
            child: CustomImageView(
              imagePath: ImageConstant.imgSearchBlack900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.h),
          child: CustomIconButton(
            height: 40.adaptSize,
            width: 40.adaptSize,
            padding: EdgeInsets.all(10.h),
            decoration: IconButtonStyleHelper.fillPrimary,
            child: CustomImageView(
              imagePath: ImageConstant.imgQrIcon,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildChooseStyleColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.tertiary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Text(
              "Choose Style",
              style: CustomTextStyles.titleSmallBlack900,
            ),
          ),
          SizedBox(height: 14.v),
          Padding(
            padding: EdgeInsets.only(left: 6.h),
            child: Wrap(
              runSpacing: 10.v,
              spacing: 10.h,
              children:
                  List<Widget>.generate(6, (index) => FilterchipItemWidget()),
            ),
          ),
          SizedBox(height: 29.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMinimumRatingColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.tertiary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Minimum Rating",
            style: CustomTextStyles.titleSmallBlack900,
          ),
          SizedBox(height: 14.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.h),
            child: CustomPinCodeTextField(
              context: context,
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 31.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWineCardInSearchList(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: AppDecoration.fillBlack,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 10.v,
          );
        },
        itemCount: 9,
        itemBuilder: (context, index) {
          return WinecardinsearchlistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBarColumn(BuildContext context) {
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
