import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Userprofilelist2ItemWidget extends StatelessWidget {
  const Userprofilelist2ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
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
              imagePath: ImageConstant.imgArrowDown,
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
              imagePath: ImageConstant.imgXIcon,
            ),
          ),
        ),
      ],
    );
  }
}
