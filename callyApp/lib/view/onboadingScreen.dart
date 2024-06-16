import 'package:callingapp/app_pages.dart';
import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/onboadingController.dart';
import 'package:callingapp/widgetComponents/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboadingScreen extends GetView<OnboadingController>{
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.color3,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetsImage.appLogo,
            width: 180,
          ),
          SizedBox(
            height: Get.height * 0.13,
          ),
          Text(
            "The best chat app in Bharat",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: ColorConst.color7,
            ),
          ),
          SizedBox(
            height: Get.height * 0.17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ClickableButton(
              title: 'Continue',
              height: 57,
              width: Get.width,
              backgroungColor: ColorConst.color1,
              elevation: 5,
              onTap: () {
                Get.offNamed(Routes.AUTH);
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
        ],
      ),
    );
  }

}