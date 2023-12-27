import '../wishlist_screen/widgets/filterstars2_item_widget.dart';
import '../wishlist_screen/widgets/winecardinsearch_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_iconbutton.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_leading_image.dart';
import 'package:savorsipv2/widgets/app_bar/custom_app_bar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 12.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.h, right: 10.h, bottom: 10.v),
                        child: Column(children: [
                          _buildFrameThirtyFive(context),
                          SizedBox(height: 20.v),
                          _buildFrameThirtySix(context),
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
            child: AppbarIconbutton(
                imagePath: ImageConstant.imgSearchWhiteA700,
                margin: EdgeInsets.only(left: 300.h))),
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildFrameThirtyFive(BuildContext context) {
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
                  child:
                      Text("Choose Style", style: theme.textTheme.titleSmall)),
              SizedBox(height: 14.v),
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 33.v,
                            width: 51.h,
                            child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          height: 32.v,
                                          width: 51.h,
                                          decoration: BoxDecoration(
                                              color: appTheme.whiteA700,
                                              borderRadius:
                                                  BorderRadius.circular(8.h)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 29.h,
                                          margin: EdgeInsets.only(left: 10.h),
                                          child: Text("Wine Style",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(height: 1.33))))
                                ])),
                        SizedBox(
                            height: 33.v,
                            width: 51.h,
                            child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          height: 32.v,
                                          width: 51.h,
                                          decoration: BoxDecoration(
                                              color: appTheme.whiteA700,
                                              borderRadius:
                                                  BorderRadius.circular(8.h)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 29.h,
                                          margin: EdgeInsets.only(left: 10.h),
                                          child: Text("Wine Style",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(height: 1.33))))
                                ])),
                        SizedBox(
                            height: 33.v,
                            width: 51.h,
                            child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          height: 32.v,
                                          width: 51.h,
                                          decoration: BoxDecoration(
                                              color: appTheme.whiteA700,
                                              borderRadius:
                                                  BorderRadius.circular(8.h)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 29.h,
                                          margin: EdgeInsets.only(left: 10.h),
                                          child: Text("Wine Style",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(height: 1.33))))
                                ])),
                        SizedBox(
                            height: 33.v,
                            width: 51.h,
                            child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          height: 32.v,
                                          width: 51.h,
                                          decoration: BoxDecoration(
                                              color: appTheme.whiteA700,
                                              borderRadius:
                                                  BorderRadius.circular(8.h)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 29.h,
                                          margin: EdgeInsets.only(left: 10.h),
                                          child: Text("Wine Style",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(height: 1.33))))
                                ])),
                        SizedBox(
                            height: 33.v,
                            width: 51.h,
                            child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          height: 32.v,
                                          width: 51.h,
                                          decoration: BoxDecoration(
                                              color: appTheme.whiteA700,
                                              borderRadius:
                                                  BorderRadius.circular(8.h)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 29.h,
                                          margin: EdgeInsets.only(left: 10.h),
                                          child: Text("Wine Style",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(height: 1.33))))
                                ])),
                        SizedBox(
                            height: 33.v,
                            width: 51.h,
                            child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          height: 32.v,
                                          width: 51.h,
                                          decoration: BoxDecoration(
                                              color: appTheme.whiteA700,
                                              borderRadius:
                                                  BorderRadius.circular(8.h)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                          width: 29.h,
                                          margin: EdgeInsets.only(left: 10.h),
                                          child: Text("Wine Style",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(height: 1.33))))
                                ]))
                      ])),
              SizedBox(height: 29.v)
            ]));
  }

  /// Section Widget
  Widget _buildFrameThirtySix(BuildContext context) {
    return Container(
        width: 370.h,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 2.v),
        decoration: AppDecoration.tertiary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Minimum Rating", style: theme.textTheme.titleSmall),
              SizedBox(height: 14.v),
              Align(
                  alignment: Alignment.center,
                  child: Wrap(
                      runSpacing: 10.v,
                      spacing: 10.h,
                      children: List<Widget>.generate(
                          5, (index) => Filterstars2ItemWidget()))),
              SizedBox(height: 31.v)
            ]));
  }

  /// Section Widget
  Widget _buildWineCardInSearch(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: AppDecoration.background
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder16),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return WinecardinsearchItemWidget();
            }));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
