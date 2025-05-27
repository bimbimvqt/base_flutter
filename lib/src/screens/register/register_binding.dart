import 'package:get/get.dart';
import 'package:song_social/src/screens/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
