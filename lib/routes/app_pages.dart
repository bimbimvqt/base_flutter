import 'package:get/route_manager.dart';
import 'package:startup_app/src/screens/login/login_binding.dart';
import 'package:startup_app/src/screens/login/login_screen.dart';
import 'package:startup_app/src/screens/on_boarding/on_boarding_binding.dart';

import '../src/screens/on_boarding/on_boarding_screen.dart';
import '../src/screens/splash/splash_binding.dart';
import '../src/screens/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: Routes.SPLASH,
      page: SplashScreen.new,
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: LoginScreen.new,
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ON_BOARDING,
      page: OnBoardingScreen.new,
      binding: OnBoardingBinding(),
    ),
  ];
}
