import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_leading_image.dart';
import 'package:savorsipv2/widgets/app_bar/custom_app_bar.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 45.v),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Spacer(flex: 42),
                  Container(
                      height: 250.adaptSize,
                      width: 250.adaptSize,
                      padding: EdgeInsets.only(top: 78.v),
                      decoration: AppDecoration.fillBlueGray,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCamera,
                          height: 84.v,
                          width: 93.h,
                          alignment: Alignment.topCenter)),
                  Spacer(flex: 57),
                  Container(
                      height: 40.v,
                      width: 80.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.h, vertical: 5.v),
                      decoration: AppDecoration.primary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgCameraIconWhiteA700,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          alignment: Alignment.center))
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 389.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVectorWhiteA700,
            margin: EdgeInsets.fromLTRB(17.h, 18.v, 357.h, 19.v),
            onTap: () {
              onTapVector(context);
            }));
  }

  /// Navigates back to the previous screen.
  onTapVector(BuildContext context) {
    Navigator.pop(context);
  }
}
