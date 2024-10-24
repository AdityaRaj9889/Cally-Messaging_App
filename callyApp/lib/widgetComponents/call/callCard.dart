import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CallCard extends GetView<CallCard> {
  final String title;
  final String profilePic;
  final String time;
  final String callType;
  final String callStatus;
  final void Function()? onPressed;

  const CallCard({
    required this.title,
    required this.profilePic,
    required this.time,
    required this.callType,
    required this.callStatus,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              profilePic,
              height: 55,
              width: 55,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SvgPicture.asset(
                      getIconForStatus(callStatus),
                      color: callStatus == 'm'
                          ? ColorConst.color5
                          : ColorConst.color1,
                      height: 20,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: ColorConst.color4,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ColorConst.color10,
                ),
                child: SvgPicture.asset(
                  callStatus == 'v' ? AssetsSVG.video : AssetsSVG.phone,
                  color: ColorConst.color1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String getIconForStatus(String status) {
    String icon = '';
    if (status == 'm') {
      icon = AssetsSVG.missedCall;
    } else if (status == 'o') {
      icon = AssetsSVG.outgoingCall;
    } else {
      icon = AssetsSVG.incomingCall;
    }
    return icon;
  }
}
