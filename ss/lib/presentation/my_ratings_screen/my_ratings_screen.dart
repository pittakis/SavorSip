import '../my_ratings_screen/widgets/userprofile7_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_iconbutton.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_leading_image.dart';
import 'package:savorsipv2/widgets/app_bar/custom_app_bar.dart';

class MyRatingsScreen extends StatelessWidget {
  const MyRatingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 30.h, top: 12.v, right: 30.h),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.v);
                    },
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Userprofile7ItemWidget();
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 56.v,
        leadingWidth: 30.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray900,
            margin: EdgeInsets.only(left: 10.h, top: 18.v, bottom: 18.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: Container(
            margin: EdgeInsets.only(left: 10.h),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: AppbarIconbutton(
                imagePath: ImageConstant.imgSearchWhiteA700,
                margin: EdgeInsets.only(left: 300.h))),
        styleType: Style.bgShadow);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
