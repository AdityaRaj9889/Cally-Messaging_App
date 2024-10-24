import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool isEdit = false.obs;

  RxBool nameValidate = false.obs;
  RxBool aboutValidate = false.obs;
  RxBool phoneValidate = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

}
