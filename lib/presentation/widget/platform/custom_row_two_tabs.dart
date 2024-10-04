import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRowTwoTabs extends StatelessWidget {
  final int index;
  final String assetName;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRowTwoTabs(
      {super.key,
      required this.index,
      required this.assetName,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 4),
              DefaultText(
                text: text,
                color: AppColors.red,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 4),
              width(4),
              SvgPicture.asset(assetName)
            ],
          ),
          Container(
            height: 2,
            width: 90,
            color: isSelected ? AppColors.red : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
