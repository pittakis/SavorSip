import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Userprofile6ItemWidget extends StatelessWidget {
  const Userprofile6ItemWidget({Key? key})
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
        Spacer(),
        CustomElevatedButton(
          height: 33.v,
          width: 67.h,
          text: "Add",
          margin: EdgeInsets.only(
            top: 15.v,
            bottom: 21.v,
          ),
          buttonTextStyle: CustomTextStyles.titleSmallBlack900,
        ),
      ],
    );
  }
}
