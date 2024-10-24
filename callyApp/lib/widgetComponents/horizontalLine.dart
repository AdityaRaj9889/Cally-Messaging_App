import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HorizontalLine extends GetView<HorizontalLine> {
  final Color color;

  const HorizontalLine({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      width: Get.width,
      color: color,
    );
  }
}
