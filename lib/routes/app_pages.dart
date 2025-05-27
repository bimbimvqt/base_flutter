import 'package:get/route_manager.dart';
import 'package:song_social/src/screens/chat/chat_binding.dart';
import 'package:song_social/src/screens/chat/chat_screen.dart';
import 'package:song_social/src/screens/home/home_binding.dart';
import 'package:song_social/src/screens/main_screen/main_binding.dart';
import 'package:song_social/src/screens/main_screen/main_screen.dart';
import 'package:song_social/src/screens/forgot_password/forgot_password_binding.dart';
import 'package:song_social/src/screens/forgot_password/forgot_password_screen.dart';
import 'package:song_social/src/screens/home/home_screen.dart';
import 'package:song_social/src/screens/login/login_binding.dart';
import 'package:song_social/src/screens/login/login_screen.dart';
import 'package:song_social/src/screens/on_boarding/on_boarding_binding.dart';
import 'package:song_social/src/screens/register/register_binding.dart';
import 'package:song_social/src/screens/register/register_screen.dart';
import 'package:song_social/src/screens/vertification/vertification_binding.dart';
import 'package:song_social/src/screens/vertification/vertification_screen.dart';

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
    GetPage(
      name: Routes.CHAT,
      page: ChatScreen.new,
      binding: ChatBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: RegisterScreen.new,
      binding: RegisterBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: ForgotPasswordScreen.new,
      binding: ForgotPasswordBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.VERIFICATION,
      page: VertificationScreen.new,
      binding: VertificationBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.MAINSCREEN,
      page: MainScreen.new,
      bindings: [
        HomeBinding(),
      ],
      transition: Transition.fade,
      children: [
        GetPage(
          name: Routes.HOME,
          page: HomeScreen.new,
          transition: Transition.fade,
        ),
      ],
    ),
  ];
}
