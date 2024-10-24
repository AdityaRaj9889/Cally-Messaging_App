import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputTextField extends GetView<InputTextField> {
  final TextEditingController textController;
  final String? Function(String?)? validate;
  final String? Function(String)? onChange;
  final void Function(String?)? onSaved;
  final String hintText;
  final Widget? prefixIcon;
  final TextInputType inputType;
  final bool obscureText;
  final Widget? suffixIcon;
  final double size;
  final double borderWidth;
  final Color borderColor;
  final bool? enable;
  const InputTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.inputType,
    required this.obscureText,
    required this.borderColor,
    this.prefixIcon,
    this.validate,
    this.suffixIcon,
    this.size = 18,
    this.onChange,
    this.onSaved,
    this.borderWidth = 1.5,
    this.enable = true,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: textController,
      validator: validate,
      keyboardType: inputType,
      obscureText: obscureText,
      onChanged: onChange,
      enabled: enable,
      style: TextStyle(
        letterSpacing: 0.3,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: ColorConst.color9,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConst.color3,
        contentPadding: EdgeInsets.all(size),
        errorStyle: TextStyle(
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: ColorConst.color5,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(40.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(40.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.color1, width: borderWidth),
          borderRadius: BorderRadius.circular(40.0),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          letterSpacing: 0.3,
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: ColorConst.color6,
        ),
        prefixIconConstraints:
            const BoxConstraints(minHeight: 20, minWidth: 20),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: prefixIcon,
        ),
        suffixIconConstraints:
            const BoxConstraints(minHeight: 20, minWidth: 20),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
