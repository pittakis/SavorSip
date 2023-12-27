import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/widgets/custom_elevated_button.dart';
import 'package:savorsipv2/widgets/custom_text_form_field.dart';

class LoginDarkScreen extends StatelessWidget {
  LoginDarkScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 9.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 37.v),
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle41,
                  height: 200.v,
                  width: 196.h,
                  radius: BorderRadius.circular(
                    20.h,
                  ),
                ),
                Spacer(
                  flex: 33,
                ),
                _buildLoginForm(context),
                Spacer(
                  flex: 66,
                ),
                CustomElevatedButton(
                  width: 219.h,
                  text: "Login",
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  buttonTextStyle: CustomTextStyles.titleSmallBlack900,
                ),
                SizedBox(height: 10.v),
                Text(
                  "Don’t Have An Account?",
                  style: CustomTextStyles.labelLargeInterBlack900,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildSignUpButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: "E-mail",
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10.v),
        CustomTextFormField(
          controller: passwordController,
          hintText: "Password",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: Container(
            margin: EdgeInsets.only(
              left: 30.h,
              top: 4.v,
              bottom: 4.v,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgTrailingicon,
              height: 48.adaptSize,
              width: 48.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 56.v,
          ),
          obscureText: true,
          contentPadding: EdgeInsets.only(
            left: 16.h,
            top: 18.v,
            bottom: 18.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      width: 99.h,
      text: "Sign-Up",
      margin: EdgeInsets.only(
        left: 145.h,
        right: 145.h,
        bottom: 15.v,
      ),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallBlack900,
    );
  }
}
