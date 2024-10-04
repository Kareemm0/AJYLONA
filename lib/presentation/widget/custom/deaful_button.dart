import 'package:ageal/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DeafultButton extends StatelessWidget {
  const DeafultButton(
      {super.key,
      this.height,
      this.width,
      this.radius,
      required this.title,
      this.textColor,
      this.containerColor,
      this.borderColor,
      required this.onPressed,
      this.fontWeight,
      this.loading = false});

  final double? height;
  final double? width;
  final double? radius;
  final String title;
  final Color? textColor;
  final Color? containerColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final FontWeight? fontWeight;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: containerColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10),
            side: BorderSide(color: borderColor ?? AppColors.white),
          ),
        ),
        child: loading
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: TextStyle(
                    color: textColor ?? AppColors.white,
                    fontSize: 16,
                    fontWeight: fontWeight ?? FontWeight.w700),
              ),
      ),
    );
  }
}
