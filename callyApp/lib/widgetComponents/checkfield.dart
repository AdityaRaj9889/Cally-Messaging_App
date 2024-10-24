import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkfield extends GetView<Checkfield> {
  final RxBool checked;
  final String txt;
  const Checkfield({required this.checked, required this.txt, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            fillColor: WidgetStateProperty.all(ColorConst.color1),
            side: WidgetStateBorderSide.resolveWith((states) {
              return BorderSide(color: ColorConst.color1, width: 2.0);
            }),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            checkColor: ColorConst.color3,
            value: checked.value,
            onChanged: (bool? val) {
              checked.value = val as bool;
            },
          ),
          Text(
            txt,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: ColorConst.color7,
            ),
          )
        ],
      ),
    );
  }
}
