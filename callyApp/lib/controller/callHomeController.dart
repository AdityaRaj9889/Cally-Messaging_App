import 'dart:async';

import 'package:get/get.dart';

class CallHomeController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;

  RxString callStatus = "Ringing...".obs;

  RxBool isSpeker = false.obs;

  @override
  void onInit() {
    Timer(const Duration(seconds: 5), () {
      startCallTimer();
    });
    super.onInit();
  }

  void startCallTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value < 59) {
        seconds.value++;
      } else {
        seconds.value = 0;
        if (minutes.value < 59) {
          minutes.value++;
        } else {
          minutes.value = 0;
          hours.value++;
        }
      }
      callStatus.value =
          "${hours.value.toString().padLeft(2, '0')}: ${minutes.value.toString().padLeft(2, '0')}: ${seconds.value.toString().padLeft(2, '0')} mins";
    });
  }
}
