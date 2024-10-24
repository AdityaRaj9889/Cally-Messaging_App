import 'dart:async';

import 'package:callingapp/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isUserLogin = false.obs;
  RxBool isLoader = false.obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () {
      if (!isUserLogin.value) {
        isLoader.value = true;
        Timer(const Duration(seconds: 2), () => Get.offNamed(Routes.ONBOADING));
      } else {
        Get.offNamed(Routes.AUTH);
      }
    });
    super.onInit();
  }
}
