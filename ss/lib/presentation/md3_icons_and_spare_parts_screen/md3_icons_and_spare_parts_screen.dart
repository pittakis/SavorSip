import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_floating_text_field.dart';
import 'package:savorsipv2/widgets/custom_icon_button.dart';
import 'package:savorsipv2/widgets/custom_text_form_field.dart';

class Md3IconsAndSparePartsScreen extends StatelessWidget {
  Md3IconsAndSparePartsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameController = TextEditingController();

  TextEditingController wineNamevalueController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: 553.h,
            padding: EdgeInsets.symmetric(
              horizontal: 19.h,
              vertical: 12.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 47.v,
                  width: 374.h,
                  margin: EdgeInsets.only(left: 3.h),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomFloatingTextField(
                        width: 366.h,
                        controller: nameController,
                        labelText: "Wine Name",
                        labelStyle: theme.textTheme.bodyLarge!,
                        hintText: "Wine Name",
                        alignment: Alignment.topCenter,
                        contentPadding:
                            EdgeInsets.fromLTRB(10.h, 17.v, 10.h, 9.v),
                        borderDecoration:
                            FloatingTextFormFieldStyleHelper.custom,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Venue Name",
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 9.v),
                _buildWineNameValueRow(context),
                SizedBox(height: 17.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 6.h,
                    right: 246.h,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse49,
                        height: 64.adaptSize,
                        width: 64.adaptSize,
                        radius: BorderRadius.circular(
                          32.h,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgWinePic,
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        margin: EdgeInsets.only(
                          left: 19.h,
                          top: 18.v,
                          bottom: 6.v,
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        imagePath: ImageConstant.imgDefaultMarkerComponent,
                        height: 20.v,
                        width: 16.h,
                        margin: EdgeInsets.only(
                          top: 17.v,
                          bottom: 27.v,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.v),
                _buildCloseRow(context),
                SizedBox(height: 17.v),
                _buildCameraIconRow(context),
                SizedBox(height: 21.v),
                Padding(
                  padding: EdgeInsets.only(left: 34.h),
                  child: Text(
                    "999",
                    style: CustomTextStyles.titleLargeWhiteA700,
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWineNameValueRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 3.h,
        right: 43.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                width: 211.h,
                controller: wineNamevalueController,
                hintText: "Text Here",
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 9.v,
                ),
                borderDecoration: TextFormFieldStyleHelper.outlineBlack1,
                fillColor: theme.colorScheme.secondaryContainer,
              ),
              SizedBox(height: 15.v),
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgCellarIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(top: 2.v),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgProfileIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        top: 2.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgSearchBlack900,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        top: 2.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgMapIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(left: 10.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowDown,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        top: 2.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCameraIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        top: 2.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCrownIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(left: 10.h),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 11.v),
              Container(
                width: 272.h,
                margin: EdgeInsets.only(left: 2.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWineBottleIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(bottom: 12.v),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgXIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 7.h,
                        bottom: 12.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgQrIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 13.h,
                        bottom: 10.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowLeft,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 10.h,
                        bottom: 10.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgAddIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 9.h,
                        bottom: 10.v,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCorrectIcon,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(
                        left: 11.h,
                        bottom: 12.v,
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowDown,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      margin: EdgeInsets.only(bottom: 12.v),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgThumbsUp,
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      margin: EdgeInsets.only(left: 11.h),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.v),
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWineBottleIconBlack900,
                      height: 19.adaptSize,
                      width: 19.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 3.v,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "Search result",
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 19.h,
              top: 4.v,
              bottom: 81.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Here will be the wine description",
                  style: theme.textTheme.labelMedium,
                ),
                SizedBox(height: 12.v),
                Text(
                  "Username",
                  style: CustomTextStyles.titleLargeWhiteA700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCloseRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 11.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgWineCardImage,
            height: 218.v,
            width: 360.h,
            margin: EdgeInsets.only(top: 4.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 36.h,
              bottom: 9.v,
            ),
            child: DottedBorder(
              color: appTheme.deepPurpleA200,
              padding: EdgeInsets.only(
                left: 1.h,
                top: 1.v,
                right: 1.h,
                bottom: 1.v,
              ),
              strokeWidth: 1.h,
              radius: Radius.circular(5),
              borderType: BorderType.RRect,
              dashPattern: [
                10,
                5,
              ],
              child: Container(
                padding: EdgeInsets.all(19.h),
                decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 22.adaptSize,
                              width: 22.adaptSize,
                              padding: EdgeInsets.symmetric(
                                horizontal: 1.h,
                                vertical: 3.v,
                              ),
                              decoration: AppDecoration.background.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder11,
                              ),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgClose,
                                height: 13.v,
                                width: 20.h,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.v),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
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
                    ),
                    SizedBox(height: 15.v),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCameraIconRow(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          left: 34.h,
          right: 8.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.v),
              child: DottedBorder(
                color: appTheme.deepPurpleA200,
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 1.v,
                  right: 1.h,
                  bottom: 1.v,
                ),
                strokeWidth: 1.h,
                radius: Radius.circular(5),
                borderType: BorderType.RRect,
                dashPattern: [
                  10,
                  5,
                ],
                child: Container(
                  padding: EdgeInsets.all(19.h),
                  decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 40.v,
                        width: 80.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.h,
                          vertical: 5.v,
                        ),
                        decoration: AppDecoration.primary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCameraIconWhiteA700,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          alignment: Alignment.center,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          height: 40.v,
                          width: 80.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.h,
                            vertical: 5.v,
                          ),
                          decoration:
                              AppDecoration.fillSecondaryContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder20,
                          ),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgCameraIconWhiteA700,
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 43,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.v,
                bottom: 20.v,
              ),
              child: DottedBorder(
                color: appTheme.deepPurpleA200,
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 1.v,
                  right: 1.h,
                  bottom: 1.v,
                ),
                strokeWidth: 1.h,
                radius: Radius.circular(5),
                borderType: BorderType.RRect,
                dashPattern: [
                  10,
                  5,
                ],
                child: Container(
                  padding: EdgeInsets.all(19.h),
                  decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconButton(
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        padding: EdgeInsets.all(5.h),
                        decoration: IconButtonStyleHelper.fillWhiteATL15,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCameraIconOnprimary,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      Opacity(
                        opacity: 0.5,
                        child: CustomIconButton(
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          padding: EdgeInsets.all(5.h),
                          decoration: IconButtonStyleHelper.fillWhiteATL151,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgCameraIconOnprimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.v,
                bottom: 20.v,
              ),
              child: DottedBorder(
                color: appTheme.deepPurpleA200,
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 1.v,
                  right: 1.h,
                  bottom: 1.v,
                ),
                strokeWidth: 1.h,
                radius: Radius.circular(5),
                borderType: BorderType.RRect,
                dashPattern: [
                  10,
                  5,
                ],
                child: Container(
                  padding: EdgeInsets.all(19.h),
                  decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgProperty1Default,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                      ),
                      SizedBox(height: 20.v),
                      Opacity(
                        opacity: 0.5,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgProperty1Default,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 26,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.v),
              child: DottedBorder(
                color: appTheme.deepPurpleA200,
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 1.v,
                  right: 1.h,
                  bottom: 1.v,
                ),
                strokeWidth: 1.h,
                radius: Radius.circular(5),
                borderType: BorderType.RRect,
                dashPattern: [
                  10,
                  5,
                ],
                child: Container(
                  padding: EdgeInsets.all(19.h),
                  decoration: AppDecoration.outlineDeepPurpleA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconButton(
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        padding: EdgeInsets.all(10.h),
                        decoration:
                            IconButtonStyleHelper.fillSecondaryContainer,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgQrIconWhiteA700,
                        ),
                      ),
                      SizedBox(height: 20.v),
                      CustomIconButton(
                        height: 40.adaptSize,
                        width: 40.adaptSize,
                        padding: EdgeInsets.all(10.h),
                        decoration:
                            IconButtonStyleHelper.fillSecondaryContainer,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgQrIconWhiteA700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
