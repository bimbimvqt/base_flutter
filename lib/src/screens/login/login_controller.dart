import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxBool isDarkMode = true.obs;
  RxBool isObscure = true.obs;
  RxBool isRememberMe = false.obs;
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
