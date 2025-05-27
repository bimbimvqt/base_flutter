import 'package:get/get.dart';
import 'package:song_social/src/screens/vertification/vertification_controller.dart';

class VertificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VertificationController>(
      () => VertificationController(),
    );
  }
}
