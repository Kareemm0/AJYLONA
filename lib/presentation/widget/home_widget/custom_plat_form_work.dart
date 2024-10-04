import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomPlatFormWork extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final String image;
  const CustomPlatFormWork(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppAssets.platformWork),
                width(10),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width,
                  ),
                  child: DefaultText(
                    text: title,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.ktextColor,
                    textOverflow: TextOverflow.ellipsis,
                    isCenter: false,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                context.push(Routes.events, extra: 'platfrom');
              },
              child: DefaultText(
                text: S.current.more,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyEE,
              ),
            ),
          ],
        ),
        // Network image
        Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(24)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                height: MediaQuery.sizeOf(context).height * 0.23,
                width: MediaQuery.sizeOf(context).width * 0.9,
                fit: BoxFit.fill,
              )),
        ).onTap(onPressed),
      ],
    );
  }
}
