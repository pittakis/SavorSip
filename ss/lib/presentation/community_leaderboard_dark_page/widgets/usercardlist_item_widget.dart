import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore: must_be_immutable
class UsercardlistItemWidget extends StatelessWidget {
  const UsercardlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 91.h,
      child: Padding(
        padding: EdgeInsets.only(
          top: 36.v,
          bottom: 9.v,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 2.v),
            CustomImageView(
              imagePath: ImageConstant.imgEllipse4991x91,
              height: 91.adaptSize,
              width: 91.adaptSize,
              radius: BorderRadius.circular(
                45.h,
              ),
            ),
            SizedBox(height: 9.v),
            Text(
              "@username",
              style: CustomTextStyles.titleSmallPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
