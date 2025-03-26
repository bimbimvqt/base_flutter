import 'package:get/get.dart';
import 'package:startup_app/src/screens/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
