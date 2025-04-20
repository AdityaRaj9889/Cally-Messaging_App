import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/callHomeController.dart';
import 'package:callingapp/widgetComponents/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class Callscreen extends GetView<CallHomeController> {
  final String profilePic;
  final String name;

  Callscreen({
    required this.profilePic,
    required this.name,
    super.key,
  });

  var dragOffset = 0.0.obs;
  Rx<Color> iconContainerColor = ColorConst.color2.obs;
  Rx<Color> iconColor = ColorConst.color1.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              profilePic,
              height: Get.height * 0.18,
              width: Get.height * 0.18,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            name,
            style: TextStyle(
              letterSpacing: 0.3,
              fontWeight: FontWeight.w700,
              fontSize: 19,
              color: ColorConst.color9,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isConnected.value || controller.callType == 'O')
            Text(
              controller.callStatus.value,
              style: TextStyle(
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ColorConst.color4,
              ),
            ),
          SizedBox(height: Get.height * 0.3),
          controller.callType == 'O' || controller.isConnected.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: controller.endCall,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorConst.color12,
                        ),
                        child: SvgPicture.asset(
                          AssetsSVG.cancel,
                          color: ColorConst.color5,
                        ),
                      ),
                    ),
                    if (controller.isConnected.value) const SizedBox(width: 30),
                    if (controller.isConnected.value)
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: controller.setSpeker,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          height: 60,
                          width: 60,
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: controller.isSpeker.value
                                ? ColorConst.color1
                                : ColorConst.color10,
                          ),
                          child: SvgPicture.asset(
                            AssetsSVG.speaker,
                            color: controller.isSpeker.value
                                ? ColorConst.color3
                                : ColorConst.color1,
                          ),
                        ),
                      ),
                  ],
                )
              : GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    final maxSlide = Get.width / 2 - 40;
                    dragOffset.value += details.delta.dx;
                    dragOffset.value =
                        dragOffset.value.clamp(-maxSlide, maxSlide);

                    if (dragOffset.value > maxSlide - 15) {
                      iconContainerColor.value = ColorConst.color5;
                      iconColor.value = ColorConst.color3;
                    } else if (dragOffset.value < 15 - maxSlide) {
                      iconContainerColor.value = ColorConst.color1;
                      iconColor.value = ColorConst.color3;
                    } else {
                      iconContainerColor.value = ColorConst.color2;
                      iconColor.value = ColorConst.color1;
                    }
                  },
                  onHorizontalDragEnd: (details) {
                    final maxSlide = Get.width / 2 - 40;

                    if (dragOffset.value > maxSlide - 15) {
                      controller.endCall();
                    } else if (dragOffset.value < 15 - maxSlide) {
                      controller.callConnected();
                    }

                    // Animate back to center
                    Future.microtask(() async {
                      await Future.delayed(const Duration(milliseconds: 100));
                      while (dragOffset.value.abs() > 1) {
                        await Future.delayed(const Duration(milliseconds: 5));
                        dragOffset.value -= dragOffset.value * 0.2;
                      }
                      dragOffset.value = 0;
                      iconContainerColor.value = ColorConst.color2;
                      iconColor.value = ColorConst.color1;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      RippleAnimation(
                        color: ColorConst.color2,
                        delay: const Duration(milliseconds: 300),
                        repeat: true,
                        minRadius: 80,
                        ripplesCount: 3,
                        duration: const Duration(milliseconds: 1800),
                        child: Container(),
                      ),
                      Transform.translate(
                        offset: Offset(dragOffset.value, 0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: iconContainerColor.value,
                          ),
                          child: SvgPicture.asset(
                            AssetsSVG.phone,
                            color: iconColor.value,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
