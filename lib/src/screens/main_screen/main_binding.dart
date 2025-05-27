import 'package:get/get.dart';
import 'package:song_social/src/screens/main_screen/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
