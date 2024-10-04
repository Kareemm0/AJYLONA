import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../auth_widget/custom_text_from_filed.dart';
import '../custom/app_text.dart';
import 'custom_community_card.dart';
import 'custom_news_item_card.dart';
import 'custom_plat_form_work.dart';
import 'custom_tab_bar_home.dart';
import 'custom_viedo_player_widget.dart';

class CustomHomeShimmer extends StatelessWidget {
  const CustomHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey82,
      highlightColor: AppColors.greyE0,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        height(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppAssets.notification),
            width(100),
            Image.asset(AppAssets.logo)
          ],
        ),
        height(18),
        CustomTextFromFiled(controller: TextEditingController()),
        height(16),
        const CustomTabBarHome(),
        height(16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(text: ""),
            DefaultText(text: ""),
          ],
        ),
        height(16),
        const CustomViedoPlayerWidget(),
        height(16),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AppAssets.aboutCommunityPic,
            fit: BoxFit.fill,
          ),
        ),
        height(16),
        const DefaultText(text: ""),
        const CustomNewsItemCard(
          newsEntity: [],
        ),
        Row(
          children: [
            const DefaultText(text: ""),
            const SizedBox(width: 8),
            SvgPicture.asset(AppAssets.platformWork),
          ],
        ),
        height(10),
        CustomPlatFormWork(
            onPressed: () {}, title: "", image: AppAssets.aboutCommunityPic),
        height(12),
        const DefaultText(text: ""),
        height(12),
        const CustomCommunityCard(
          communityImage: AppAssets.aboutCommunityPic,
          communityTitle: "",
          communityBody: "",
        )
      ]),
    );
  }
}
