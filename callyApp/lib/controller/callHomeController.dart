import 'dart:async';

import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallHomeController extends GetxController {
  RxBool isLoading = false.obs;

  String profilePic = AssetsImage.appLogo;
  String name = "Kristin Waston";

  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;

  RxString callStatus = "Ringing...".obs;

  RxBool isSpeker = false.obs;
  RxBool isConnected = false.obs;

  var dragOffset = 0.0.obs;
  Rx<Color> iconContainerColor = ColorConst.color2.obs;
  Rx<Color> iconColor = ColorConst.color1.obs;

  String callType = "";
  String serviceType = "";

  @override
  void onInit() {
    var param = Get.parameters;
    callType = param["callType"] ?? "";
    serviceType = param["serviceType"] ?? "";
    super.onInit();

    if (callType == 'O') Timer(Duration(seconds: 5), () => callConnected());
  }

  void callConnected() {
    isConnected.value = true;
    startCallTimer();
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

  void setSpeker() {
    isSpeker.toggle();
  }

  void endCall() {
    Get.back();
  }
}
