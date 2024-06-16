import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClickableButton extends GetView<ClickableButton> {
  final String title;
  final double width;
  final double height;
  final double elevation;
  final Color backgroungColor;
  final double radius;
  final double horizontalPadding;
  final double verticalPadding;
  void Function()? onTap;

  ClickableButton({
    required this.title,
    required this.height,
    required this.width,
    required this.backgroungColor,
    this.elevation = 10,
    this.radius = 40.0,
    this.horizontalPadding = 10.0,
    this.verticalPadding = 10.0,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        elevation: elevation,
        backgroundColor: backgroungColor,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        textStyle: TextStyle(
            color: ColorConst.color3, fontSize: 18, fontStyle: FontStyle.normal),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        shadowColor: ColorConst.color4,
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}
