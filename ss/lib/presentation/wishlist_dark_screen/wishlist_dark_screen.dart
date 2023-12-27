import '../wishlist_dark_screen/widgets/filterchip2_item_widget.dart';
import '../wishlist_dark_screen/widgets/winecardinsearch1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_iconbutton_one.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_leading_image.dart';
import 'package:savorsipv2/widgets/app_bar/custom_app_bar.dart';
import 'package:savorsipv2/widgets/custom_pin_code_text_field.dart';

class WishlistDarkScreen extends StatelessWidget {
  const WishlistDarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 12.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.h, right: 10.h, bottom: 10.v),
                        child: Column(children: [
                          _buildChooseStyle(context),
                          SizedBox(height: 20.v),
                          _buildMinimumRating(context),
                          SizedBox(height: 20.v),
                          _buildWineCardInSearch(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 58.v,
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
            child: AppbarIconbuttonOne(
                imagePath: ImageConstant.imgSearchBlack900,
                margin: EdgeInsets.only(left: 300.h))),
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildChooseStyle(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.v),
        decoration: AppDecoration.tertiary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text("Choose Style",
                      style: CustomTextStyles.titleSmallBlack900)),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Wrap(
                      runSpacing: 10.v,
                      spacing: 10.h,
                      children: List<Widget>.generate(
                          6, (index) => Filterchip2ItemWidget()))),
              SizedBox(height: 29.v)
            ]));
  }

  /// Section Widget
  Widget _buildMinimumRating(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 2.v),
        decoration: AppDecoration.tertiary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Minimum Rating",
                  style: CustomTextStyles.titleSmallBlack900),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.h),
                  child: CustomPinCodeTextField(
                      context: context, onChanged: (value) {})),
              SizedBox(height: 31.v)
            ]));
  }

  /// Section Widget
  Widget _buildWineCardInSearch(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: AppDecoration.fillBlack
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder16),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return Winecardinsearch1ItemWidget();
            }));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
