import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../custom/app_text.dart';

class CustomHrizontalListViewBody extends StatelessWidget {
  final String text;
  final Color? containerColor;
  final Color? textColor;
  final Function()? onTap;
  const CustomHrizontalListViewBody({
    super.key,
    required this.text,
    this.containerColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.red),
          ),
          child: DefaultText(
            text: text,
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
