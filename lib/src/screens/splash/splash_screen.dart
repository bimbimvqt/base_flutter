import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:song_social/animations/show_up_widget.dart';

import '../../../resources/app_assets.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: ShowWidget(
              delay: 4,
              child: Image.asset(AppAssets.imgVector2),
            ),
          ),
          Center(
            child: FadeInImage(
              image: AssetImage(AppAssets.icSplash),
              placeholder: AssetImage(AppAssets.icSplash),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ShowWidget(
              delay: 4,
              child: Image.asset(AppAssets.imgVector1),
            ),
          ),
        ],
      ),
    );
  }
}
