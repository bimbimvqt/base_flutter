import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:song_social/resources/app_assets.dart';
import 'package:song_social/src/screens/on_boarding/on_boarding_controller.dart';
import 'package:song_social/widgets/button_outline.dart';

import '../../../routes/app_pages.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Obx(
          () => Stack(
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.onLastPage.value = (index == 2);
                },
                children: [
                  _buildPage(
                    title: 'Welcome',
                    description: 'Welcome to our app! Let\'s get started.',
                    image: AppAssets.imgP1,
                  ),
                  _buildPage(
                    title: 'Features',
                    description: 'Get all your loved foods in one once place, you just place the orer we do the rest',
                    image: AppAssets.imgP2,
                  ),
                  _buildPage(
                    title: 'Get Started',
                    description: 'Let\'s get you set up and ready to go!',
                    image: AppAssets.imgP3,
                  ),
                ],
              ),
              Container(
                alignment: Alignment(0, 0.45),
                child: SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotColor: Theme.of(context).colorScheme.secondaryContainer,
                    activeDotColor: Theme.of(context).colorScheme.surface,
                    dotHeight: 8.h,
                    dotWidth: 8.w,
                    spacing: 5.w,
                    expansionFactor: 2,
                  ),
                  controller: controller.pageController,
                  count: 3,
                ),
              ),
              Positioned(
                bottom: 100,
                left: 15.w,
                right: 15.w,
                child: Column(
                  children: [
                    controller.onLastPage.value
                        ? ButtonOutLineWidget(
                            title: 'DONE',
                            onTap: () {
                              Get.offNamed(Routes.LOGIN);
                            },
                          )
                        : ButtonOutLineWidget(
                            title: 'NEXT',
                            onTap: () {
                              controller.pageController
                                  .nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                            },
                          ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        Get.offNamed(Routes.LOGIN);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildPage({required String title, required String description, required String image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250.h,
            child: Image.asset(
              image,
              width: 150.w,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF00C0DD)),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Color(0xFF454545)),
          ),
        ],
      ),
    );
  }
}
