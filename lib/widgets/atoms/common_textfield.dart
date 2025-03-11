import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final Widget prefixIcon;
  final Color fillColor;
  final Color textColor;
  final Color hintColor;
  final double? borderRadius;
  final bool? obscureText;

  const CommonTextField(
      {super.key,
        required this.controller,
        required this.keyboardType,
        required this.hintText,
        required this.prefixIcon,
        required this.fillColor,
        required this.textColor,
        required this.hintColor,
        this.borderRadius = 10,
        this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
