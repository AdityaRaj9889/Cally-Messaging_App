import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/profileController.dart';
import 'package:callingapp/widgetComponents/appbar.dart';
import 'package:callingapp/widgetComponents/errorbox.dart';
import 'package:callingapp/widgetComponents/horizontalLine.dart';
import 'package:callingapp/widgetComponents/loader.dart';
import 'package:callingapp/widgetComponents/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressLoader(
        loading: controller.isLoading.value,
        child: Scaffold(
          backgroundColor: ColorConst.color3,
          appBar: AppbarWidget(
            title: 'Profile'.obs,
            firstIcon: controller.isEdit.value
                ? AssetsSVG.done.obs
                : AssetsSVG.edit.obs,
            fIconClick: () {
              controller.isLoading.value = true;
              controller.isEdit.toggle();
              if (controller.isEdit.value) {}
              controller.isLoading.value = false;
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: HorizontalLine(
                      color: ColorConst.color6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
                    child: Center(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                              AssetsImage.appLogo,
                              height: Get.height * 0.18,
                              width: Get.height * 0.18,
                            ),
                          ),
                          Positioned(
                              bottom: 1,
                              right: 1,
                              child: ClipOval(
                                child: Container(
                                  color: ColorConst.color1,
                                  padding: EdgeInsets.all(Get.height * 0.0095),
                                  child: SvgPicture.asset(
                                    AssetsSVG.edit,
                                    color: ColorConst.color3,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  HorizontalLine(
                    color: ColorConst.color6,
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Name",
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
                  InputTextField(
                    enable: controller.isEdit.value,
                    onChange: (_) {
                      controller.isLoading.value = true;
                      controller.isLoading.value = false;
                      return null;
                    },
                    borderColor: controller.nameValidate.value
                        ? ColorConst.color5
                        : controller.nameController.text.isEmpty
                            ? ColorConst.color6
                            : ColorConst.color1,
                    borderWidth: 1.5,
                    textController: controller.nameController,
                    hintText: 'Name',
                    inputType: TextInputType.name,
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  controller.nameValidate.value
                      ? const Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: ErrorBox(
                              message: "Invalid name, please check again"),
                        )
                      : Container(),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "About",
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
                  InputTextField(
                    enable: controller.isEdit.value,
                    onChange: (_) {
                      controller.isLoading.value = true;
                      controller.isLoading.value = false;
                      return null;
                    },
                    borderColor: controller.aboutValidate.value
                        ? ColorConst.color5
                        : controller.aboutController.text.isEmpty
                            ? ColorConst.color6
                            : ColorConst.color1,
                    borderWidth: 1.5,
                    textController: controller.aboutController,
                    hintText: 'About',
                    inputType: TextInputType.name,
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  controller.aboutValidate.value
                      ? const Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: ErrorBox(
                              message: "Invalid about, please check again"),
                        )
                      : Container(),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  InputTextField(
                    enable: controller.isEdit.value,
                    onChange: (_) {
                      controller.isLoading.value = true;
                      controller.isLoading.value = false;
                      return null;
                    },
                    borderColor: controller.phoneValidate.value
                        ? ColorConst.color5
                        : controller.phoneController.text.isEmpty
                            ? ColorConst.color6
                            : ColorConst.color1,
                    borderWidth: 1.5,
                    textController: controller.phoneController,
                    hintText: 'Phone Number',
                    inputType: TextInputType.phone,
                    obscureText: false,
                    suffixIcon: null,
                  ),
                  controller.phoneValidate.value
                      ? const Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: ErrorBox(
                              message:
                                  "Invalid phone number, please check again"))
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
