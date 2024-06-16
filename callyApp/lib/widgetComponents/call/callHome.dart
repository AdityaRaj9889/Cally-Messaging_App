import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/homeController.dart';
import 'package:callingapp/widgetComponents/call/callCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CallHomeWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
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
                  AssetsSVG.archive,
                  color: ColorConst.color1,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Archived",
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
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => const CallCard(
                title: "Allen",
                profilePic: AssetsImage.appLogo,
                time: 'Today, 12:40',
                callType: 'v',
                callStatus: 'm',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
