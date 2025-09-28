import 'package:flutter/material.dart';
import 'package:sohail_portfolio/core/constant/color_constant.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: mTextStyle12(color: ColorConstant.blackColor),
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: mTextStyle14(color: ColorConstant.blackColor),
        hintText: hint,
        hintStyle: mTextStyle12(color: ColorConstant.blackColor.withOpacity(0.4)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: ColorConstant.endColor, width: 0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(   // 🔴 error case me border
          borderSide:  BorderSide(color: Colors.red.shade500, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.red.shade500, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
