import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  RxBool validate = false.obs;
  RxBool isLoading = false.obs;
  RxBool rememberMe = false.obs;

  RxString type = 'l'.obs;

  TextEditingController phoneController = TextEditingController();
}
