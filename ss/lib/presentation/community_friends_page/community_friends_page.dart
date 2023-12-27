import '../community_friends_page/widgets/userprofile2_item_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class CommunityFriendsPage extends StatefulWidget {
  const CommunityFriendsPage({Key? key})
      : super(
          key: key,
        );

  @override
  CommunityFriendsPageState createState() => CommunityFriendsPageState();
}

class CommunityFriendsPageState extends State<CommunityFriendsPage>
    with AutomaticKeepAliveClientMixin<CommunityFriendsPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.v),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.h),
                      decoration: AppDecoration.background,
                      child: Column(
                        children: [
                          SizedBox(height: 3.v),
                          _buildUsername(context),
                          SizedBox(height: 15.v),
                          _buildUsername1(context),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.v),
                    CustomElevatedButton(
                      width: 142.h,
                      text: "Add Friends",
                      leftIcon: Container(
                        margin: EdgeInsets.only(right: 8.h),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgPlus,
                          height: 18.adaptSize,
                          width: 18.adaptSize,
                        ),
                      ),
                      buttonStyle: CustomButtonStyles.fillSecondaryContainer,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUsername(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pending Requests",
          style: CustomTextStyles.headlineMediumBlack900,
        ),
        SizedBox(height: 3.v),
        DottedBorder(
          color: appTheme.black900,
          padding: EdgeInsets.only(
            left: 3.h,
            top: 3.v,
            right: 3.h,
            bottom: 3.v,
          ),
          strokeWidth: 3.h,
          radius: Radius.circular(15),
          borderType: BorderType.RRect,
          dashPattern: [
            6,
            6,
          ],
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 2.v,
            ),
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 3.v),
                _buildUserSInfo(context),
                SizedBox(height: 4.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse49,
                      height: 64.adaptSize,
                      width: 64.adaptSize,
                      radius: BorderRadius.circular(
                        32.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 5.v,
                        bottom: 5.v,
                      ),
                      child: _buildUserProfile(
                        context,
                        fullName: "Full name",
                        username: "@username",
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 17.v),
                      child: CustomIconButton(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        padding: EdgeInsets.all(5.h),
                        decoration: IconButtonStyleHelper.fillDeepPurple,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgMdiTick,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 17.v,
                        bottom: 17.v,
                      ),
                      child: CustomIconButton(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        padding: EdgeInsets.all(5.h),
                        decoration: IconButtonStyleHelper.fillDeepPurple,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgXIconWhiteA700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.v),
                _buildUserSInfo(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildUsername1(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 1.v,
                bottom: 5.v,
              ),
              child: Text(
                "Friendlist",
                style: CustomTextStyles.headlineMediumBlack900,
              ),
            ),
            Container(
              height: 40.v,
              width: 238.h,
              decoration: AppDecoration.outlineBlack900.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: CustomIconButton(
                height: 40.adaptSize,
                width: 40.adaptSize,
                padding: EdgeInsets.all(10.h),
                decoration: IconButtonStyleHelper.fillSecondaryContainer,
                alignment: Alignment.centerRight,
                child: CustomImageView(
                  imagePath: ImageConstant.imgSearchWhiteA700,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.v),
        DottedBorder(
          color: appTheme.black900,
          padding: EdgeInsets.only(
            left: 3.h,
            top: 3.v,
            right: 3.h,
            bottom: 3.v,
          ),
          strokeWidth: 3.h,
          radius: Radius.circular(15),
          borderType: BorderType.RRect,
          dashPattern: [
            6,
            6,
          ],
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            decoration: AppDecoration.outlineBlack.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder16,
            ),
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return Userprofile2ItemWidget();
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildUserProfile(
    BuildContext context, {
    required String fullName,
    required String username,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fullName,
          style: theme.textTheme.titleLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          username,
          style: CustomTextStyles.titleMediumBlack900_1.copyWith(
            color: appTheme.black900.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildUserSInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
            bottom: 11.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full name",
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(height: 8.v),
              Text(
                "@username",
                style: CustomTextStyles.titleMediumBlack900_1,
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 17.v,
            bottom: 23.v,
          ),
          child: CustomIconButton(
            height: 30.adaptSize,
            width: 30.adaptSize,
            padding: EdgeInsets.all(5.h),
            decoration: IconButtonStyleHelper.fillDeepPurple,
            child: CustomImageView(
              imagePath: ImageConstant.imgMdiTick,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.h,
            top: 17.v,
            bottom: 23.v,
          ),
          child: CustomIconButton(
            height: 30.adaptSize,
            width: 30.adaptSize,
            padding: EdgeInsets.all(5.h),
            decoration: IconButtonStyleHelper.fillDeepPurple,
            child: CustomImageView(
              imagePath: ImageConstant.imgXIconWhiteA700,
            ),
          ),
        ),
      ],
    );
  }
}
