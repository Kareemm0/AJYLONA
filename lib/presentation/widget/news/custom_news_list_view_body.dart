import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../generated/l10n.dart';
import '../custom/app_text.dart';

class CustomNewsListViewBody extends StatelessWidget {
  final String srcImage;
  final String title;
  final String content;

  const CustomNewsListViewBody({
    super.key,
    required this.srcImage,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                srcImage,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            width(8),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                    text: title,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor4E,
                  ),
                  height(4),
                  DefaultText(
                    text: content,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
          ],
        ),
        height(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(
              Icons.share_outlined,
              color: AppColors.ktextColor,
              size: 16,
            ),
            width(8),
            DefaultText(
              text: S.current.share,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ],
    );
  }
}
