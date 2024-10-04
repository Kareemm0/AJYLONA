import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../../../core/constants/app_colors.dart';

class CustomShimmerVideo extends StatelessWidget {
  const CustomShimmerVideo({super.key});

  @override
  Widget build(BuildContext context) {
    VideoPlayerController controller = VideoPlayerController.asset("");
    return Shimmer.fromColors(
      baseColor: AppColors.grey82,
      highlightColor: AppColors.greyE0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
