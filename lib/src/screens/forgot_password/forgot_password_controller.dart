import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:song_social/resources/custom_style.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>().obs;
  bool isEmailValid = false;

  void validateEmail() {
    isEmailValid = GetUtils.isEmail(emailController.value.text);
    update();
  }
}
