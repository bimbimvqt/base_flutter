import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:startup_app/resources/app_assets.dart';
import 'package:startup_app/resources/custom_style.dart';
import 'package:startup_app/routes/app_pages.dart';
import 'package:startup_app/src/screens/main_screen/main_screen.dart';
import 'package:startup_app/src/screens/login/login_controller.dart';
import 'package:startup_app/widgets/button_outline.dart';
import 'package:startup_app/widgets/text_field.dart';

import '../../../resources/dimensions.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.CHAT,
          );
        },
        child: Icon(Icons.chat),
      ),
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
                          'Log In',
                          style: CustomStyle.appBarTitleText(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 36.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Please sign in to your existing account',
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
          Obx(() => Expanded(
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
                            title: 'LOG IN',
                            onTap: () {
                              Get.offAllNamed(Routes.MAINSCREEN);
                              // if (controller.formKey.currentState!.validate()) {
                              //   debugPrint('Login');
                              // }
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: CustomStyle.body2Text(
                                color: Theme.of(context).textTheme.labelSmall?.color,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.REGISTER);
                              },
                              child: Text(
                                'SIGN UP',
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
              ))
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
                if (!GetUtils.isEmail(value!)) {
                  return 'Please enter a valid email';
                }
                return null;
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
            child: Text(
              'PASSWORD',
              style: CustomStyle.body1Text(color: Theme.of(context).textTheme.labelMedium?.color),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultPadding.w,
            ),
            child: TextFieldWidget(
              validator: (value) {
                if (!GetUtils.isLengthGreaterOrEqual(value!, 6)) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.isObscure.value = !controller.isObscure.value;
                },
                child: Icon(
                  controller.isObscure.value ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              obscureText: controller.isObscure.value ? false : true,
              controller: controller.passwordController,
              label: 'Password',
              hint: 'Enter your password',
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding.w),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    checkColor: Theme.of(context).colorScheme.onTertiary,
                    splashRadius: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    activeColor: Theme.of(context).colorScheme.surface,
                    value: controller.isRememberMe.value,
                    onChanged: (value) {
                      controller.isRememberMe.value = value!;
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Remember me',
                  style: CustomStyle.body2Text(
                    color: Theme.of(context).textTheme.labelSmall?.color,
                    fontSize: 16.sp,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.FORGOT_PASSWORD);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: CustomStyle.body2Text(
                      color: Theme.of(context).textTheme.displayMedium?.color,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
