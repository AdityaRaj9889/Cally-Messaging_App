import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Callscreen extends GetView<Callscreen> {
  final String type;
  final String profilePic;
  final String name;
  final String serviceType;
  final RxString callStatus;
  final void Function()? fIconPressed;
  final String sIcon;
  final void Function()? sIconPressed;
  final RxBool isSpeker;

  const Callscreen({
    required this.type,
    required this.profilePic,
    required this.name,
    required this.serviceType,
    required this.callStatus,
    this.fIconPressed,
    required this.sIcon,
    this.sIconPressed,
    required this.isSpeker,
    super.key,
  });

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
          Text(
            callStatus.value,
            style: TextStyle(
              letterSpacing: 0.3,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorConst.color4,
            ),
          ),
          SizedBox(height: Get.height * 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: fIconPressed,
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
              if (callStatus.value != "Ringing...") const SizedBox(width: 30),
              if (callStatus.value != "Ringing...")
                InkWell(
                  onTap: sIconPressed,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15.0),
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: ColorConst.color10,
                    ),
                    child: SvgPicture.asset(
                      sIcon,
                      color: ColorConst.color1,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
