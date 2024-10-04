import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/widget/custom/deaful_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

import 'custom_shimmer_video.dart';

class CustomViedoPlayerWidget extends StatefulWidget {
  const CustomViedoPlayerWidget({super.key});

  @override
  State<CustomViedoPlayerWidget> createState() =>
      _CustomViedoPlayerWidgetState();
}

class _CustomViedoPlayerWidgetState extends State<CustomViedoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/motions.mp4')
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized.
        _controller.play(); // Auto-play the video once initialized
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _controller.value.isInitialized
            ? Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: DeafultButton(
                      title: S.current.moreDetils,
                      onPressed: () {
                        context.push(Routes.events, extra: 'event');
                      },
                      textColor: AppColors.white,
                      containerColor: AppColors.red,
                      borderColor: AppColors.red,
                    ),
                  )
                ],
              )
            : const CustomShimmerVideo()
        //const CircularProgressIndicator(),
        );
  }
}
