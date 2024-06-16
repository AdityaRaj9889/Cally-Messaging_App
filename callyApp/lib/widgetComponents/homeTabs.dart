import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/homeController.dart';
import 'package:callingapp/widgetComponents/horizontalLine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTabs extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Column(
        children: [
          const SizedBox(height: 10.0,),
          Container(
            color: ColorConst.color3,
            padding: const EdgeInsets.only(left: 15, right: 15,),
            height: 50,
            child: Obx(
              () => TabBar(
                labelColor: ColorConst.color1,
                unselectedLabelColor: ColorConst.color9,
                onTap: (index) => controller.tabIndex.value = index,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0, color: ColorConst.color1),
                ),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "CHATS",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        controller.chatCount.value > 0
                            ? Container(
                                margin: const EdgeInsets.only(left: 3),
                                height: 21,
                                width: 21,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  color: controller.tabIndex.value == 0
                                      ? ColorConst.color1
                                      : ColorConst.color9,
                                ),
                                child: Center(
                                  child: Text(
                                    controller.chatCount.value > 99
                                        ? "99+"
                                        : controller.chatCount.value.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConst.color3,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "STATUS",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        controller.statusCount.value > 0
                            ? Container(
                                margin: const EdgeInsets.only(left: 3),
                                height: 21,
                                width: 21,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  color: controller.tabIndex.value == 1
                                      ? ColorConst.color1
                                      : ColorConst.color9,
                                ),
                                child: Center(
                                  child: Text(
                                    controller.statusCount.value > 99
                                        ? "99+"
                                        : controller.statusCount.value.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConst.color3,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "CALLS",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        controller.callCount.value > 0
                            ? Container(
                                margin: const EdgeInsets.only(left: 3),
                                height: 21,
                                width: 21,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  color: controller.tabIndex.value == 2
                                      ? ColorConst.color1
                                      : ColorConst.color9,
                                ),
                                child: Center(
                                  child: Text(
                                    controller.callCount.value > 99
                                        ? "99+"
                                        : controller.callCount.value.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConst.color3,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          HorizontalLine(color: ColorConst.color6)
        ],
      ),
    );
  }
}
