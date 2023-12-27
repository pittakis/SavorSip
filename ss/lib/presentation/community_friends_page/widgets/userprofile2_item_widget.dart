import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile2ItemWidget extends StatelessWidget {
  const Userprofile2ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
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
