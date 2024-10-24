import 'package:callingapp/app_pages.dart';
import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/authController.dart';
import 'package:callingapp/widgetComponents/button.dart';
import 'package:callingapp/widgetComponents/checkfield.dart';
import 'package:callingapp/widgetComponents/errorbox.dart';
import 'package:callingapp/widgetComponents/loader.dart';
import 'package:callingapp/widgetComponents/textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressLoader(
        loading: controller.isLoading.value,
        child: Scaffold(
          backgroundColor: ColorConst.color3,
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AssetsImage.appLogo,
                            height: 180,
                            width: 180,
                          ),
                          SizedBox(
                            height: Get.height * 0.15,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        controller.type.value == 's'
                            ? "Sign up for free"
                            : "Sign in to your account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: ColorConst.color7,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.06,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Phone Number",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConst.color9,
                              ),
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConst.color5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: InputTextField(
                        onChange: (_) {
                          controller.isLoading.value = true;
                          controller.isLoading.value = false;
                          return null;
                        },
                        borderColor: controller.validate.value
                            ? ColorConst.color5
                            : controller.phoneController.text.isEmpty
                                ? ColorConst.color6
                                : ColorConst.color1,
                        borderWidth: 1.5,
                        textController: controller.phoneController,
                        hintText: 'Phone Number',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: SvgPicture.asset(
                            AssetsSVG.phone,
                            color: ColorConst.color4,
                            height: 23,
                          ),
                        ),
                        inputType: TextInputType.phone,
                        obscureText: false,
                        suffixIcon: null,
                      ),
                    ),
                    controller.validate.value
                        ? Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: ErrorBox(
                                message: controller.type.value == 's'
                                    ? "Invalid phone number, please check again"
                                    : "The phone number is not registered in the system"),
                          )
                        : Container(),
                    SizedBox(
                      height: Get.height * 0.005,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Checkfield(
                          checked: controller.rememberMe, txt: "Remember me"),
                    ),
                    SizedBox(
                      height: Get.height * 0.005,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: ClickableButton(
                        title: controller.type.value == 's'
                            ? "Sign up"
                            : 'Sign in',
                        height: 57,
                        width: Get.width,
                        backgroungColor: controller.validate.value
                            ? ColorConst.color2
                            : ColorConst.color1,
                        elevation: controller.validate.value ? 0 : 5,
                        onTap: () {
                          if (controller.rememberMe.value) {
                            Get.toNamed(Routes.OTPVERIFY);
                          } else {
                            controller.validate.toggle();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConst.color7,
                              ),
                            ),
                            TextSpan(
                              text: controller.type.value == 's'
                                  ? "Sign in"
                                  : 'Sign up',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  controller.phoneController.clear();
                                  controller.validate.value = false;
                                  controller.type.value == 's'
                                      ? controller.type.value = 'l'
                                      : controller.type.value = 's';
                                },
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConst.color1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
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
