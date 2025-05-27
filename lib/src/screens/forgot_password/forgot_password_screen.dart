import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:song_social/resources/app_assets.dart';
import 'package:song_social/resources/custom_style.dart';
import 'package:song_social/resources/dimensions.dart';
import 'package:song_social/routes/app_pages.dart';
import 'package:song_social/src/screens/forgot_password/forgot_password_controller.dart';
import 'package:song_social/widgets/button_outline.dart';
import 'package:song_social/widgets/text_field.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          Container(
            height: Get.height / 3.5,
            width: Get.width,
            color: Theme.of(context).colorScheme.secondary,
            child: Container(
              height: Get.height / 3.5,
              width: Get.width,
              color: Theme.of(context).colorScheme.secondary,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      AppAssets.imgVector3,
                      width: 150.w,
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                    left: 10.w,
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onTertiary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.only(left: 4),
                        onPressed: () {
                          Get.back(
                            closeOverlays: true,
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios, size: 16.sp),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Forgot Password',
                            style: CustomStyle.appBarTitleText(
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                              fontSize: 30.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            'Enter your email to reset your password',
                            style: CustomStyle.body2Text(
                              color: Theme.of(context).textTheme.bodyMedium?.color,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.defaultPadding.h,
                ),
                child: Column(
                  children: [
                    _buildTextField(context),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding.w),
                      child: ButtonOutLineWidget(
                        title: 'SEND CODE',
                        onTap: () {
                          Get.toNamed(Routes.VERIFICATION);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Form(
      key: controller.formKey.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child: Text(
              'EMAIL',
              style: CustomStyle.body1Text(color: Theme.of(context).textTheme.labelMedium?.color),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
              vertical: 10.h,
            ),
            child: TextFieldWidget(
              validator: (value) {
                if (!GetUtils.isEmail(value!)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              controller: controller.emailController.value,
              label: 'Email',
              hint: 'Enter your email',
            ),
          ),
        ],
      ),
    );
  }
}
