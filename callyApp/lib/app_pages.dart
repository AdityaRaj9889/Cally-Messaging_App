// ignore_for_file: constant_identifier_names

import 'package:callingapp/binding/authBinding.dart';
import 'package:callingapp/binding/chatBinding.dart';
import 'package:callingapp/binding/homeBinding.dart';
import 'package:callingapp/binding/onboadingBinding.dart';
import 'package:callingapp/binding/otpVerifyBinding.dart';
import 'package:callingapp/binding/profileBinding.dart';
import 'package:callingapp/binding/splashBinding.dart';
import 'package:callingapp/view/authScreen.dart';
import 'package:callingapp/view/chatScreen.dart';
import 'package:callingapp/view/homeScreen.dart';
import 'package:callingapp/view/onboadingScreen.dart';
import 'package:callingapp/view/oypVerifyScreen.dart';
import 'package:callingapp/view/profileScreen.dart';
import 'package:callingapp/view/splashScreen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOADING,
      page: () => OnboadingScreen(),
      binding: OnboadingBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.OTPVERIFY,
      page: () => OtpVerifyScreen(),
      binding: OtpVerifyBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
  ];
}
