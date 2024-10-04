import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../custom/app_text.dart';
import '../custom/custom_arrow_forward.dart';

class CustomNewsShimmerWidget extends StatelessWidget {
  const CustomNewsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomStackScaffold(
      body: Shimmer.fromColors(
        baseColor: AppColors.grey82,
        highlightColor: AppColors.greyE0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            children: [
              const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: CustomArrowBack()),
              height(8),
              Image.network(
                width: widthSize(context),
                height: heightSize(context) * 0.18,
                "",
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  AppAssets.news,
                  fit: BoxFit.fill,
                ),
                fit: BoxFit.fill,
              ),
              height(8),
              const DefaultText(
                text: "Loading......",
              ),
              height(8),
              const DefaultText(
                maxLines: 100,
                text: "Loading......",
              )
            ],
          ),
        ),
      ),
    );
  }
}
