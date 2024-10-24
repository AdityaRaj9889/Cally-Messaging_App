import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChatCard extends GetView<ChatCard> {
  final String profilePic;
  final String title;
  final RxString subTitle;
  final String mesStatus;
  final RxString msgTime;
  final RxInt msgCount;
  final bool chatMute;

  const ChatCard({
    required this.profilePic,
    required this.title,
    required this.subTitle,
    this.mesStatus = '',
    required this.msgTime,
    required this.msgCount,
    this.chatMute = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
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
                    mesStatus.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              getIconForStatus(mesStatus),
                              color: mesStatus == 'r'
                                  ? ColorConst.color1
                                  : ColorConst.color4,
                              height: 20,
                            ),
                          ),
                    Text(
                      subTitle.value,
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
            Column(
              children: [
                Text(
                  msgTime.value,
                  style: TextStyle(
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: ColorConst.color4,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    chatMute
                        ? Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              AssetsSVG.mute,
                              color: ColorConst.color1,
                              height: 20,
                            ),
                          )
                        : Container(),
                    msgCount.value > 0
                        ? Container(
                            margin: const EdgeInsets.only(left: 3),
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                              color: ColorConst.color1,
                            ),
                            child: Center(
                              child: Text(
                                msgCount.value > 99
                                    ? "99+"
                                    : msgCount.value.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorConst.color3,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String getIconForStatus(String status) {
    String icon = '';
    if (status == 's') {
      icon = AssetsSVG.singleTick;
    } else if (status == 'c' || status == 'r') {
      icon = AssetsSVG.doubleTick;
    } else {
      icon = AssetsSVG.clock;
    }
    return icon;
  }
}
