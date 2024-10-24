import 'dart:async';

import 'package:callingapp/app_pages.dart';
import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/otpVerifyController.dart';
import 'package:callingapp/widgetComponents/appbar.dart';
import 'package:callingapp/widgetComponents/button.dart';
import 'package:callingapp/widgetComponents/errorbox.dart';
import 'package:callingapp/widgetComponents/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OtpVerifyScreen extends GetView<OtpVerifyController> {
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressLoader(
        loading: controller.isLoading.value,
        child: Scaffold(
          backgroundColor: ColorConst.color3,
          appBar: AppbarWidget(
            title: 'Enter OTP Code'.obs,
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height - 85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Code has been send to ${controller.securePassword(controller.phone)}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: ColorConst.color7,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.08,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 76,
                                child: TextFormField(
                                  validator: (input) {
                                    if (input!.trim().isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  controller: controller.t1Controller,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    } else {
                                      FocusScope.of(context).nextFocus();
                                    }
                                    controller.isLoading.value = true;
                                    controller.isLoading.value = false;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConst.color3,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                      color: ColorConst.color1,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: controller.validate.value
                                              ? ColorConst.color5
                                              : controller.t1Controller.text
                                                      .isNotEmpty
                                                  ? ColorConst.color1
                                                  : ColorConst.color6,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConst.color2, width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.color7,
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 76,
                                child: TextFormField(
                                  validator: (input) {
                                    if (input!.trim().isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  controller: controller.t2Controller,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else {
                                      FocusScope.of(context).nextFocus();
                                    }
                                    controller.isLoading.value = true;
                                    controller.isLoading.value = false;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConst.color3,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                      color: ColorConst.color1,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: controller.validate.value
                                              ? ColorConst.color5
                                              : controller.t2Controller.text
                                                      .isNotEmpty
                                                  ? ColorConst.color1
                                                  : ColorConst.color6,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConst.color2, width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.color7,
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 76,
                                child: TextFormField(
                                  validator: (input) {
                                    if (input!.trim().isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  controller: controller.t3Controller,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else {
                                      FocusScope.of(context).nextFocus();
                                    }
                                    controller.isLoading.value = true;
                                    controller.isLoading.value = false;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConst.color3,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                      color: ColorConst.color1,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: controller.validate.value
                                              ? ColorConst.color5
                                              : controller.t3Controller.text
                                                      .isNotEmpty
                                                  ? ColorConst.color1
                                                  : ColorConst.color6,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConst.color2, width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.color7,
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 76,
                                child: TextFormField(
                                  validator: (input) {
                                    if (input!.trim().isEmpty) {
                                      return "";
                                    }
                                    return null;
                                  },
                                  controller: controller.t4Controller,
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    } else {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                    controller.isLoading.value = true;
                                    controller.isLoading.value = false;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConst.color3,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.3,
                                      color: ColorConst.color1,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: controller.validate.value
                                              ? ColorConst.color5
                                              : controller.t4Controller.text
                                                      .isNotEmpty
                                                  ? ColorConst.color1
                                                  : ColorConst.color6,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorConst.color2, width: 1.5),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.color7,
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.025,
                        ),
                        controller.validate.value
                            ? const ErrorBox(message: "Invalid OTP code")
                            : Container(),
                        SizedBox(
                          height: Get.height * 0.085,
                        ),
                        controller.resendOtp.value
                            ? TextButton(
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConst.color1,
                                  ),
                                ),
                                onPressed: () async {},
                              )
                            : RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Resend code in ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConst.color7,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '25',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConst.color1,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 's',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: ColorConst.color7,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClickableButton(
                        title: 'Continue',
                        height: 57,
                        width: Get.width,
                        backgroungColor: controller.validate.value
                            ? ColorConst.color2
                            : ColorConst.color1,
                        elevation: controller.validate.value ? 0 : 5,
                        onTap: () {
                          if (controller.t1Controller.text.isEmpty) {
                            controller.validate.toggle();
                          } else {
                            controller.isLoading.value = true;
                            Timer(const Duration(seconds: 2),
                                () => Get.offAllNamed(Routes.HOME));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
