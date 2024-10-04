import 'package:ageal/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool isCenter;
  final TextStyle? googleFont;
  final FontWeight? fontWeight;
  final Color? color;
  final int maxLines;
  final TextOverflow textOverflow;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  const DefaultText({
    super.key,
    required this.text,
    this.fontSize,
    this.isCenter = true,
    this.googleFont,
    this.fontWeight,
    this.color,
    this.maxLines = 3,
    this.textOverflow = TextOverflow.ellipsis,
    this.decoration,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.ktextColor,
      ),
    );
  }
}
