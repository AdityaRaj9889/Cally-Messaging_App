import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/widgetComponents/status/statusView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusCard extends GetView<StatusCard> {
  final RxString personName;
  final RxString profile;
  final RxString time;
  final RxInt seenCount;
  final RxInt statusCount;

  const StatusCard({
    required this.personName,
    required this.profile,
    required this.time,
    required this.seenCount,
    required this.statusCount,
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
            personName.value == 'My Status'
                ? Stack(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          profile.value,
                          height: 55,
                          width: 55,
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: ClipOval(
                          child: Container(
                            color: ColorConst.color3,
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.add_circle_outline,
                              size: 18,
                              color: ColorConst.color1,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : StatusView(
                    centerImageUrl: profile.value,
                    indexOfSeenStatus: seenCount.value,
                    numberOfStatus: statusCount.value,
                    seenColor: ColorConst.color4,
                    unSeenColor: ColorConst.color1,
                  ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  personName.value,
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
                  time.value,
                  style: TextStyle(
                    letterSpacing: 0.3,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorConst.color4,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
