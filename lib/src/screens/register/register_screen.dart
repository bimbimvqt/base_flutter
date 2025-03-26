import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_app/resources/app_assets.dart';
import 'package:startup_app/resources/custom_style.dart';
import 'package:startup_app/src/screens/register/register_controller.dart';
import 'package:startup_app/widgets/button_outline.dart';
import 'package:startup_app/widgets/text_field.dart';

import '../../../resources/dimensions.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          Container(
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: CustomStyle.appBarTitleText(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 36.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Create a new account',
                          style: CustomStyle.body2Text(
                            color: Theme.of(context).textTheme.bodyMedium?.color,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
                      child: ButtonOutLineWidget(
                        title: 'SIGN UP',
                        onTap: () {
                          if (controller.formKey.currentState!.validate()) {
                            print('Sign Up');
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: CustomStyle.body2Text(
                            color: Theme.of(context).textTheme.labelSmall?.color,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () {
                            Get.back(
                              closeOverlays: true,
                            );
                          },
                          child: Text(
                            'SIGN IN',
                            style: CustomStyle.body2Text(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
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
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child: Text('EMAIL', style: CustomStyle.body1Text(color: Theme.of(context).textTheme.labelMedium?.color)),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child: TextFieldWidget(
              validator: (value) {
                return controller.validateEmail(value!);
              },
              controller: controller.emailController,
              label: 'Email',
              hint: 'Enter your email',
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child:
                Text('PASSWORD', style: CustomStyle.body1Text(color: Theme.of(context).textTheme.labelMedium?.color)),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child: Obx(
              () => TextFieldWidget(
                validator: (value) {
                  return controller.validatePassword(value!);
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.toggleObscure();
                  },
                  child: Icon(
                    controller.isObscure.value ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                obscureText: controller.isObscure.value,
                controller: controller.passwordController,
                onChanged: (p0) {
                  controller.passwordController.text = p0;
                },
                label: 'Password',
                hint: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child: Text('CONFIRM PASSWORD',
                style: CustomStyle.body1Text(color: Theme.of(context).textTheme.labelMedium?.color)),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child: Obx(() => TextFieldWidget(
                  validator: (value) {
                    return controller.validateConfirmPassword(value!);
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.toggleConfirmObscure();
                    },
                    child: Icon(
                      controller.isConfirmObscure.value ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  obscureText: controller.isConfirmObscure.value,
                  controller: controller.confirmPasswordController,
                  onChanged: (p0) {
                    controller.confirmPasswordController.text = p0;
                  },
                  label: 'Confirm Password',
                  hint: 'Confirm your password',
                  keyboardType: TextInputType.visiblePassword,
                )),
          ),
        ],
      ),
    );
  }
}
