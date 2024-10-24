import 'package:callingapp/controller/callHomeController.dart';
import 'package:get/get.dart';

class CallHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallHomeController>(
      () => CallHomeController(),
    );
  }
}
