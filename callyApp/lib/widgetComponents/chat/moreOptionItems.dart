import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MoreOptionItems extends GetView {
  void Function()? itemTap;
  String? itemName;
  String? itemIcon;

  MoreOptionItems({
    super.key,
    this.itemTap,
    required this.itemName,
    required this.itemIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: itemTap,
          child: Container(
            height: 65,
            width: 65,
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorConst.color10,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                itemIcon.toString(),
                color: ColorConst.color1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          itemName.toString(),
          style: TextStyle(
            fontSize: 14,
            color: ColorConst.color9,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
