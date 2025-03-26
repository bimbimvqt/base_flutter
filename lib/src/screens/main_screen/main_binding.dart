import 'package:get/get.dart';
import 'package:startup_app/src/screens/main_screen/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
