import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_leading_image.dart';
import 'package:savorsipv2/widgets/app_bar/custom_app_bar.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';
import 'package:savorsipv2/widgets/custom_floating_text_field.dart';

// ignore_for_file: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  TextEditingController firstNameTextFieldController = TextEditingController();

  TextEditingController lastNameTextFieldController = TextEditingController();

  TextEditingController userNameTextFieldController = TextEditingController();

  TextEditingController dateOfBirthTextFieldController =
      TextEditingController();

  TextEditingController newPasswordTextFieldController =
      TextEditingController();

  TextEditingController confirmNewPasswordTextFieldController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildFirstNameTextField(context),
                          SizedBox(height: 2.v),
                          _buildLastNameTextField(context),
                          SizedBox(height: 2.v),
                          _buildUserNameTextField(context),
                          SizedBox(height: 2.v),
                          _buildDateOfBirthTextField(context),
                          SizedBox(height: 2.v),
                          _buildNewPasswordTextField(context),
                          SizedBox(height: 2.v),
                          _buildConfirmNewPasswordTextField(context),
                          SizedBox(height: 10.v),
                          _buildChangeProfilePictureButton(context),
                          SizedBox(height: 5.v)
                        ]))),
            bottomNavigationBar: _buildSaveChangesButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 389.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVectorBlueGray900,
            margin: EdgeInsets.fromLTRB(12.h, 18.v, 362.h, 19.v),
            onTap: () {
              onTapVector(context);
            }));
  }

  /// Section Widget
  Widget _buildFirstNameTextField(BuildContext context) {
    return CustomFloatingTextField(
        controller: firstNameTextFieldController,
        labelText: "First Name ",
        labelStyle: CustomTextStyles.bodyLargeGray900,
        hintText: "First Name ");
  }

  /// Section Widget
  Widget _buildLastNameTextField(BuildContext context) {
    return CustomFloatingTextField(
        controller: lastNameTextFieldController,
        labelText: "Last Name",
        labelStyle: CustomTextStyles.bodyLargeGray900,
        hintText: "Last Name");
  }

  /// Section Widget
  Widget _buildUserNameTextField(BuildContext context) {
    return CustomFloatingTextField(
        controller: userNameTextFieldController,
        labelText: "Username",
        labelStyle: CustomTextStyles.bodyLargeGray900,
        hintText: "Username");
  }

  /// Section Widget
  Widget _buildDateOfBirthTextField(BuildContext context) {
    return CustomFloatingTextField(
        controller: dateOfBirthTextFieldController,
        labelText: "Date of Birth",
        labelStyle: CustomTextStyles.bodyLargeGray900,
        hintText: "Date of Birth");
  }

  /// Section Widget
  Widget _buildNewPasswordTextField(BuildContext context) {
    return CustomFloatingTextField(
        controller: newPasswordTextFieldController,
        labelText: "New Password ",
        labelStyle: theme.textTheme.bodySmall!,
        hintText: "New Password ",
        hintStyle: theme.textTheme.bodySmall!,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.fromLTRB(16.h, -7.v, 16.h, 48.v));
  }

  /// Section Widget
  Widget _buildConfirmNewPasswordTextField(BuildContext context) {
    return CustomFloatingTextField(
        controller: confirmNewPasswordTextFieldController,
        labelText: "Confirm New Password",
        labelStyle: theme.textTheme.bodySmall!,
        hintText: "Confirm New Password",
        hintStyle: theme.textTheme.bodySmall!,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        obscureText: true,
        contentPadding: EdgeInsets.fromLTRB(16.h, -8.v, 16.h, 49.v));
  }

  /// Section Widget
  Widget _buildChangeProfilePictureButton(BuildContext context) {
    return CustomElevatedButton(
        width: 209.h,
        text: "Change Profile Picture",
        leftIcon: Container(
            margin: EdgeInsets.only(right: 8.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgCameraIconWhiteA700,
                height: 18.adaptSize,
                width: 18.adaptSize)),
        buttonStyle: CustomButtonStyles.fillSecondaryContainer);
  }

  /// Section Widget
  Widget _buildSaveChangesButton(BuildContext context) {
    return CustomElevatedButton(
        width: 138.h,
        text: "Save Changes",
        margin: EdgeInsets.only(left: 126.h, right: 126.h, bottom: 15.v),
        buttonStyle: CustomButtonStyles.fillSecondaryContainer);
  }

  /// Navigates back to the previous screen.
  onTapVector(BuildContext context) {
    Navigator.pop(context);
  }
}
