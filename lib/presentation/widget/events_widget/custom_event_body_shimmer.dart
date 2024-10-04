import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:ageal/presentation/widget/events_widget/custom_shimmer_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomEventBodyShimmer extends StatelessWidget {
  const CustomEventBodyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomStackScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Shimmer.fromColors(
          baseColor: AppColors.grey82,
          highlightColor: AppColors.greyE0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(20),
              Image.network(
                width: widthSize(context),
                height: heightSize(context) * 0.18,
                "",
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  AppAssets.aboutCommunityPic,
                  fit: BoxFit.fill,
                ),
                fit: BoxFit.fill,
              ),
              height(16),
              const DefaultText(text: ""),
              const Expanded(
                child: CustomShimmerGridView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
