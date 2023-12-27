import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/app_bar/appbar_leading_image.dart';
import 'package:savorsipv2/widgets/app_bar/custom_app_bar.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';
import 'package:savorsipv2/widgets/custom_floating_text_field.dart';
import 'package:savorsipv2/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignupDarkScreen extends StatelessWidget {
  SignupDarkScreen({Key? key}) : super(key: key);

  TextEditingController firstNameEditTextController = TextEditingController();

  TextEditingController lastNameEditTextController = TextEditingController();

  TextEditingController userNameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 28.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle41,
                          height: 200.v,
                          width: 196.h,
                          radius: BorderRadius.circular(20.h)),
                      SizedBox(height: 53.v),
                      _buildFirstNameEditText(context),
                      SizedBox(height: 10.v),
                      _buildLastNameEditText(context),
                      SizedBox(height: 10.v),
                      _buildUserNameEditText(context),
                      SizedBox(height: 10.v),
                      _buildEmailEditText(context),
                      SizedBox(height: 10.v),
                      _buildPasswordEditText(context),
                      SizedBox(height: 10.v),
                      _buildInputDatePicker(context),
                      SizedBox(height: 10.v)
                    ]))),
            bottomNavigationBar: _buildCreateAccount(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 389.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVector,
            margin: EdgeInsets.fromLTRB(17.h, 18.v, 357.h, 19.v),
            onTap: () {
              onTapVector(context);
            }));
  }

  /// Section Widget
  Widget _buildFirstNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: firstNameEditTextController, hintText: "First Name");
  }

  /// Section Widget
  Widget _buildLastNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: lastNameEditTextController, hintText: "Last Name");
  }

  /// Section Widget
  Widget _buildUserNameEditText(BuildContext context) {
    return CustomTextFormField(
        controller: userNameEditTextController, hintText: "Username");
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return CustomTextFormField(
        controller: emailEditTextController,
        hintText: "E-mail",
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return CustomTextFormField(
        controller: passwordEditTextController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        suffix: Container(
            margin: EdgeInsets.only(left: 30.h, top: 4.v, bottom: 4.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgTrailingicon,
                height: 48.adaptSize,
                width: 48.adaptSize)),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        obscureText: true,
        contentPadding: EdgeInsets.only(left: 16.h, top: 18.v, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return CustomFloatingTextField(
        controller: dateOfBirthController,
        labelText: "Date of birth",
        labelStyle: CustomTextStyles.bodyLargePrimary,
        hintText: "Date of birth",
        hintStyle: CustomTextStyles.bodyLargePrimary,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildInputDatePicker(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.v),
        decoration: AppDecoration.fillBlack,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 4.v), _buildDateOfBirth(context)]));
  }

  /// Section Widget
  Widget _buildCreateAccount(BuildContext context) {
    return CustomElevatedButton(
        width: 219.h,
        text: "Create Account",
        margin: EdgeInsets.only(left: 85.h, right: 85.h, bottom: 15.v),
        buttonStyle: CustomButtonStyles.fillPrimary,
        buttonTextStyle: CustomTextStyles.titleSmallBlack900);
  }

  /// Navigates back to the previous screen.
  onTapVector(BuildContext context) {
    Navigator.pop(context);
  }
}
