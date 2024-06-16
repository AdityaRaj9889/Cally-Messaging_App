import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorBox extends GetView<ErrorBox> {
  final String message;
  const ErrorBox({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ColorConst.color8,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 19,
            color: ColorConst.color5,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: ColorConst.color5,
            ),
          )
        ],
      ),
    );
  }
}
