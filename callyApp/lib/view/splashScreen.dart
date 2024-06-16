import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController>{

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorConst.color3,
        body: Center(
          child: Column(
            mainAxisAlignment: controller.isLoader.value
                ? MainAxisAlignment.end
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AssetsImage.appLogo,
                height: 180,
                width: 180,
              ),
              controller.isLoader.value
                  ? Column(
                      children: [
                        SizedBox(
                          height: Get.height / 7,
                        ),
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: ColorConst.color3,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(
                              backgroundColor: ColorConst.color2,
                              valueColor: AlwaysStoppedAnimation(ColorConst.color1),
                              strokeWidth: 5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 7,
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}