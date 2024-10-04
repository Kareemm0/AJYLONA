import 'package:flutter/material.dart';

class CustomTextFromFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? enabled;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Function(String)? onChanged;

  const CustomTextFromFiled({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.enabled = true,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.fillColor,
    this.prefixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      enabled: enabled,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
