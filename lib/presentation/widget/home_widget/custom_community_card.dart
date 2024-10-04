import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';

class CustomCommunityCard extends StatelessWidget {
  final String communityTitle;
  final String communityBody;
  final String communityImage;
  const CustomCommunityCard(
      {super.key,
      required this.communityTitle,
      required this.communityBody,
      required this.communityImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            communityImage,
            fit: BoxFit.fill,
          ),
          height(10),
          DefaultText(
            text: communityTitle,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.kprimaryColor,
            textOverflow: TextOverflow.ellipsis,
            isCenter: false,
          ),
          height(10),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.7,
            ),
            child: DefaultText(
              text: communityBody,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.grey8f,
              textOverflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
