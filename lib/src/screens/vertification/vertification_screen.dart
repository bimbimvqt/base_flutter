import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:song_social/resources/app_assets.dart';
import 'package:song_social/resources/custom_style.dart';
import 'package:song_social/resources/dimensions.dart';
import 'package:song_social/src/screens/vertification/vertification_controller.dart';
import 'package:song_social/widgets/button_outline.dart';

class VertificationScreen extends GetView<VertificationController> {
  const VertificationScreen({super.key});

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
                          'Verification',
                          style: CustomStyle.appBarTitleText(
                            color: Theme.of(context).textTheme.bodyLarge?.color,
                            fontSize: 36.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Please enter the code sent to your email',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CODE',
                            style: CustomStyle.body3Text(
                              color: Theme.of(context).textTheme.labelMedium?.color,
                            ),
                          ),
                          Spacer(),
                          Obx(() => Text(
                                'Resend Code',
                                style: CustomStyle.body3Text(
                                  color: controller.canResend.value
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).textTheme.labelMedium?.color,
                                ),
                              )),
                          SizedBox(width: Dimensions.defaultSPadding.w),
                          Obx(() => Text(
                                controller.countdownText,
                                style: CustomStyle.body3Text(
                                  color: Theme.of(context).textTheme.labelMedium?.color,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.defaultSPadding.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultSPadding.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          4,
                          (index) => _buildVerificationCodeInput(context, index),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.defaultPadding.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding.w),
                      child: ButtonOutLineWidget(
                        title: 'VERIFY',
                        onTap: () {},
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

  Widget _buildVerificationCodeInput(BuildContext context, int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFFF0F5FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          controller: controller.textControllers[index],
          focusNode: controller.focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: CustomStyle.body1Text(
            color: Theme.of(context).textTheme.labelLarge?.color,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (index < controller.focusNodes.length - 1) {
                controller.focusNodes[index + 1].requestFocus(); // Chuyển focus đến ô tiếp theo
              } else {
                // Xử lý khi đã nhập đủ mã
                print("Mã xác thực đã nhập: ${controller.textControllers.map((c) => c.text).join()}");
              }
            }
          },
        ),
      ),
    );
  }
}
