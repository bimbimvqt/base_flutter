import 'package:get/get.dart';
import 'package:song_social/src/screens/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
