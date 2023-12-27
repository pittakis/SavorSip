import '../community_friends_dark_page/widgets/userprofilelist2_item_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class CommunityFriendsDarkPage extends StatefulWidget {
  const CommunityFriendsDarkPage({Key? key})
      : super(
          key: key,
        );

  @override
  CommunityFriendsDarkPageState createState() =>
      CommunityFriendsDarkPageState();
}

class CommunityFriendsDarkPageState extends State<CommunityFriendsDarkPage>
    with AutomaticKeepAliveClientMixin<CommunityFriendsDarkPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      decoration: AppDecoration.fillBlack,
                      child: Column(
                        children: [
                          SizedBox(height: 3.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Pending Requests",
                              style: CustomTextStyles.headlineMediumBlack900,
                            ),
                          ),
                          SizedBox(height: 6.v),
                          _buildUserProfileList(context),
                          SizedBox(height: 12.v),
                          _buildFrameFortyFiveColumn(context),
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
                          imagePath: ImageConstant.imgPlusBlack900,
                          height: 18.adaptSize,
                          width: 18.adaptSize,
                        ),
                      ),
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: CustomTextStyles.titleSmallBlack900,
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
  Widget _buildUserProfileList(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 4.v,
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return Userprofilelist2ItemWidget();
      },
    );
  }

  /// Section Widget
  Widget _buildFrameFortyFiveColumn(BuildContext context) {
    return DottedBorder(
      color: theme.colorScheme.primary,
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
        decoration: AppDecoration.outlinePrimary1.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5.v),
            _buildUserSInfoRow1(context),
            SizedBox(height: 4.v),
            _buildUserSInfoRow2(context),
            SizedBox(height: 10.v),
            _buildUserSInfoRow1(context),
            SizedBox(height: 4.v),
            _buildUserSInfoRow2(context),
            SizedBox(height: 10.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse49,
                  height: 27.v,
                  width: 64.h,
                  radius: BorderRadius.circular(
                    32.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.h,
                    top: 5.v,
                  ),
                  child: Text(
                    "Full name",
                    style: CustomTextStyles.titleLargePrimary,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgProperty1Default,
                  height: 10.v,
                  width: 30.h,
                  margin: EdgeInsets.only(top: 17.v),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildUserSInfoRow1(BuildContext context) {
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
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgProperty1Default,
          height: 30.adaptSize,
          width: 30.adaptSize,
          margin: EdgeInsets.only(
            top: 17.v,
            bottom: 23.v,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildUserSInfoRow2(BuildContext context) {
    return Row(
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
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgProperty1Default,
          height: 30.adaptSize,
          width: 30.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 17.v),
        ),
      ],
    );
  }
}
