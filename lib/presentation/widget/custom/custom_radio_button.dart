import 'package:ageal/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String value;
  final String? groupValue;
  final void Function(String?)? onChanged;
  const CustomRadioButton({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Radio(
      activeColor: AppColors.kprimaryColor,
      fillColor: const WidgetStatePropertyAll(
        Color(0xff2A3167),
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
