import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class Userprofile5ItemWidget extends StatelessWidget {
  const Userprofile5ItemWidget({Key? key})
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
            bottom: 4.v,
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
        CustomElevatedButton(
          height: 33.v,
          width: 67.h,
          text: "Add",
          margin: EdgeInsets.symmetric(vertical: 15.v),
        ),
      ],
    );
  }
}
