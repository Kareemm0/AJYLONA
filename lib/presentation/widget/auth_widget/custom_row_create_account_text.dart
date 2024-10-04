import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';

class CustomRowCreateAccountText extends StatelessWidget {
  final String haveAccount;
  final String authText;
  final void Function()? onTap;
  const CustomRowCreateAccountText({
    super.key,
    required this.haveAccount,
    required this.authText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultText(
          text: haveAccount,
          color: AppColors.grey9c,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        width(4),
        DefaultText(
          text: authText,
          color: AppColors.kprimaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        ).onTap(onTap),
      ],
    );
  }
}
