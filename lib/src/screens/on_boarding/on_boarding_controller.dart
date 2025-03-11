import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  RxBool onLastPage = false.obs;
  var currentPage = 0.obs;
}
