import 'package:callingapp/controller/onboadingController.dart';
import 'package:get/get.dart';

class OnboadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboadingController>(
      () => OnboadingController(),
    );
  }
}
