import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressLoader extends GetView<ProgressLoader> {
  final bool loading;
  final Widget child;
  final double opacity;
  final Color color;

  const ProgressLoader(
      {required this.loading,
      required this.child,
      this.opacity = 0.55,
      this.color = Colors.black,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if(loading)
        Stack(
          children: [
            Opacity(
              opacity: opacity,
              child: ModalBarrier(dismissible: false, color: color),
            ),
            Center(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: ColorConst.color3,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
                    backgroundColor: ColorConst.color2,
                    valueColor: AlwaysStoppedAnimation(ColorConst.color1),
                    strokeWidth: 5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
