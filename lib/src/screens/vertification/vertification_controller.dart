import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:song_social/resources/custom_style.dart';

class VertificationController extends GetxController {
  final codeController = TextEditingController().obs;
  final focusNodes = List<FocusNode>.generate(4, (_) => FocusNode()).obs;
  final textControllers = List<TextEditingController>.generate(4, (_) => TextEditingController()).obs;

  // Countdown timer variables
  final countdown = 60.obs;
  Timer? _timer;
  final canResend = false.obs;

  @override
  void onInit() {
    super.onInit();
    focusNodes.value = List<FocusNode>.generate(4, (_) => FocusNode());
    textControllers.value = List<TextEditingController>.generate(4, (_) => TextEditingController());
    startCountdown();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startCountdown() {
    countdown.value = 60;
    canResend.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
        canResend.value = true;
      }
    });
  }

  void resendCode() {
    if (canResend.value) {
      // TODO: Implement resend code logic here
      startCountdown();
    }
  }

  String get countdownText {
    final minutes = (countdown.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (countdown.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
