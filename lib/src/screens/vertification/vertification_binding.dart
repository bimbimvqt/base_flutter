import 'package:get/get.dart';
import 'package:startup_app/src/screens/vertification/vertification_controller.dart';

class VertificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VertificationController>(
      () => VertificationController(),
    );
  }
}
