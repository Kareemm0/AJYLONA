import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../custom/app_text.dart';

class CustomHint extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomHint(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return DefaultText(
      text: text,
      color: color ?? AppColors.grey9c,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
