import 'package:ageal/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../generated/l10n.dart';
import '../custom/app_text.dart';
import '../custom/default_button.dart';

class RemoveAccountAlert extends StatelessWidget {
  final VoidCallback onPressed;
  const RemoveAccountAlert({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      contentPadding: const EdgeInsets.all(18),
      content: SizedBox(
        width: widthSize(context) * 0.875,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultText(
              text: S.current.alert,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.kprimaryColor,
            ),
            const SizedBox(height: 24),
            DefaultText(
              text: S.current.Sure,
              fontSize: 20,
              color: AppColors.kprimaryColor,
            ),
            height(heightSize(context) * 0.056),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: DefaultButton(
                    radius: 8,
                    containerColor: AppColors.red,
                    onPressed: onPressed,
                    title: S.current.delete,
                  ),
                ),
                width(widthSize(context) * 0.03),
                Expanded(
                  child: DefaultButton(
                    radius: 8,
                    containerColor: AppColors.kprimaryColor,
                    onPressed: () {
                      // Handle cancel action
                      context.pop();
                    },
                    title: S.current.cancel,
                  ),
                ),
              ],
            ),
            height(heightSize(context) * 0.04)
          ],
        ),
      ),
    );
  }
}
