import 'package:callingapp/controller/otpVerifyController.dart';
import 'package:get/get.dart';

class OtpVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpVerifyController>(
      () => OtpVerifyController(),
    );
  }
}
