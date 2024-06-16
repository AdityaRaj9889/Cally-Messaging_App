import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController {
  RxBool validate = false.obs;
  RxBool isLoading = false.obs;
  RxBool resendOtp = false.obs;

  String phone = '8601872441';

  TextEditingController t1Controller = TextEditingController();
  TextEditingController t2Controller = TextEditingController();
  TextEditingController t3Controller = TextEditingController();
  TextEditingController t4Controller = TextEditingController();

  String securePassword(String mobile) {
    String mob = '+91${mobile.substring(0, 3)}******${mobile.substring(8, 10)}';
    return mob;
  }
}
