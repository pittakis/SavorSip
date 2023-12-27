import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  const Userprofile1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.tertiary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
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
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgWineCardImage,
            height: 111.v,
            width: 340.h,
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "Wine Name",
                          style: CustomTextStyles.titleLargeWhiteA700,
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "Venue Name",
                          style: CustomTextStyles.titleLargeWhiteA700,
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text(
                          "Here will be the wine description",
                          style: theme.textTheme.labelMedium,
                        ),
                      ),
                      SizedBox(height: 19.v),
                      Text(
                        "SavorSip Rating",
                        style: CustomTextStyles.titleLargeWhiteA700,
                      ),
                      SizedBox(height: 23.v),
                      Text(
                        "Friend’s Rating",
                        style: CustomTextStyles.titleLargeWhiteA700,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 46.v),
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgCheers,
                        height: 44.v,
                        width: 28.h,
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 10.v),
                      SizedBox(
                        width: 89.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgStar61,
                              height: 40.adaptSize,
                              width: 40.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 4.v,
                                bottom: 2.v,
                              ),
                              child: Text(
                                "0/5",
                                style: theme.textTheme.headlineMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.v),
                      SizedBox(
                        width: 89.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgStar62,
                              height: 40.adaptSize,
                              width: 40.adaptSize,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 4.v,
                                bottom: 2.v,
                              ),
                              child: Text(
                                "0/5",
                                style: theme.textTheme.headlineMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.v),
        ],
      ),
    );
  }
}
