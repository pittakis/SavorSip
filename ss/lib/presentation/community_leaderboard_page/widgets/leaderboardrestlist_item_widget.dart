import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class LeaderboardrestlistItemWidget extends StatelessWidget {
  const LeaderboardrestlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.tertiary.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder42,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 21.v),
            child: Text(
              "#4",
              style: CustomTextStyles.headlineMediumWhiteA700,
            ),
          ),
          Container(
            height: 70.v,
            width: 65.h,
            margin: EdgeInsets.only(
              left: 20.h,
              top: 6.v,
            ),
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
              top: 11.v,
              bottom: 11.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Full name",
                  style: CustomTextStyles.titleLargeWhiteA700,
                ),
                SizedBox(height: 8.v),
                Text(
                  "@username",
                  style: CustomTextStyles.titleMediumWhiteA700,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 11.v,
              bottom: 15.v,
            ),
            child: Column(
              children: [
                Text(
                  "#Rates",
                  style: CustomTextStyles.titleLargeWhiteA700,
                ),
                SizedBox(height: 4.v),
                Text(
                  "69",
                  style: CustomTextStyles.titleMediumWhiteA700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
