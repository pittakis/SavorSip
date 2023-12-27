import '../add_friends_dark_screen/widgets/userprofile6_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_iconbutton_one.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_leading_image.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_trailing_iconbutton_one.dart';
import 'package:savorsipv2/widgets/app_bar/custom_app_bar.dart';

class AddFriendsDarkScreen extends StatelessWidget {
  const AddFriendsDarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 20.h, top: 12.v, right: 20.h),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 4.v);
                    },
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Userprofile6ItemWidget();
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
            margin: EdgeInsets.only(left: 15.h),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: AppbarIconbuttonOne(
                imagePath: ImageConstant.imgSearchBlack900,
                margin: EdgeInsets.only(left: 240.h))),
        actions: [
          AppbarTrailingIconbuttonOne(
              imagePath: ImageConstant.imgQrIcon,
              margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
              onTap: () {
                onTapQRIcon(context);
              })
        ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the qrScreen when the action is triggered.
  onTapQRIcon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.qrScreen);
  }
}
