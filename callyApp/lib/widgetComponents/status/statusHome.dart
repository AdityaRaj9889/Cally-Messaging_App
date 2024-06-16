import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/homeController.dart';
import 'package:callingapp/widgetComponents/status/statusCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StatusHomeWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 10),
            height: 40,
            margin: const EdgeInsets.only(bottom: 1, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsSVG.mute,
                  color: ColorConst.color1,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Muted Status",
                  style: TextStyle(
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: ColorConst.color9,
                  ),
                ),
                const Spacer(),
                Text(
                  controller.archivedCount.value > 99
                      ? "99+"
                      : controller.archivedCount.value.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConst.color1,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          StatusCard(
            personName: 'My Status'.obs,
            profile: AssetsImage.appLogo.obs,
            time: 'Tap to add status update'.obs,
            seenCount: 0.obs,
            statusCount: 0.obs,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              // 'Muted updates',
              'Recent updates',
              style: TextStyle(
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: ColorConst.color4,
              ),
            ),
          ),
          for (int i = 0; i < 2; i++)
            StatusCard(
              personName: 'Allen Walker'.obs,
              time: '5 minutes ago'.obs,
              // time: 'Today, 18:27'.obs,
              profile: AssetsImage.appLogo.obs,
              seenCount: 5.obs,
              statusCount: 6.obs,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Viwed updates',
              style: TextStyle(
                letterSpacing: 0.3,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: ColorConst.color4,
              ),
            ),
          ),
          for (int i = 0; i < 3; i++)
            StatusCard(
              personName: 'Allen'.obs,
              time: '5 minutes ago'.obs,
              // time: 'Today, 18:27'.obs,
              profile: AssetsImage.appLogo.obs,
              seenCount: 6.obs,
              statusCount: 6.obs,
            )
        ],
      ),
    );
  }
}
