import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/callHomeController.dart';
import 'package:callingapp/widgetComponents/appbar.dart';
import 'package:callingapp/widgetComponents/call/callScreen.dart';
import 'package:callingapp/widgetComponents/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallHomeScreen extends GetView<CallHomeController> {
  const CallHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressLoader(
        loading: controller.isLoading.value,
        child: Scaffold(
          appBar: AppbarWidget(title: "".obs),
          backgroundColor: ColorConst.color3,
          body: Center(
            child: Callscreen(
                type: "O",
                // type: "I",
                profilePic: AssetsImage.appLogo,
                name: "Kristin Waston",
                serviceType: "V",
                callStatus: controller.callStatus,
                // callStatus: "04:25 mins",
                sIcon: AssetsSVG.speaker,
                isSpeker: controller.isSpeker),
          ),
        ),
      ),
    );
  }
}
