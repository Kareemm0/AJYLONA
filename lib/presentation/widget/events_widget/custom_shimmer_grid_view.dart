import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerGridView extends StatelessWidget {
  const CustomShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey82,
      highlightColor: AppColors.greyE0,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        itemCount: 20,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          width: widthSize(context) * 0.42,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '',
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.fill,
                  ),
                  fit: BoxFit.fill,
                  width: widthSize(context),
                  height: heightSize(context) * 0.14,
                ),
              ),
              height(8),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: widthSize(context),
                  minWidth: widthSize(context) * 0.5,
                ),
                child: const DefaultText(text: ''),
              ),
              height(8),
              Row(
                children: [
                  const DefaultText(text: ''),
                  width(8),
                  const Icon(Icons.location_on_outlined)
                ],
              ),
              height(8),
              Row(
                children: [
                  const DefaultText(text: ""),
                  width(8),
                  const Icon(Icons.calendar_today)
                ],
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: widthSize(context) * 0.2,
                      minWidth: widthSize(context) * 0.2,
                    ),
                    child: const DefaultText(text: ""),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.share),
                      width(8),
                      const DefaultText(text: ""),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
