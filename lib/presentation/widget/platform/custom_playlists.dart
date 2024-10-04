import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/presentation/cubit/platform/playlist/play_list_cubit.dart';
import 'package:ageal/presentation/cubit/platform/playlist/play_list_state.dart';
import 'package:ageal/presentation/widget/custom/custom_loading.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../generated/l10n.dart';
import '../custom/app_text.dart';

class CustomPlaylists extends StatelessWidget {
  const CustomPlaylists({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayListCubit(getIt())..playList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          return switch (state) {
            PlayListInitialState() =>
              const CustomStackScaffold(body: CustomLoading()),
            PlayListLoadingState() =>
              const CustomStackScaffold(body: CustomLoading()),
            PlayListFailureState(errorMessage: final message) => Center(
                child: DefaultText(
                  text: message,
                  color: AppColors.kprimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            PlayListSuccessState(playlistsAndEpisodes: final playList) =>
              CustomStackScaffold(
                  body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  separatorBuilder: (context, index) => height(8),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.network(
                          "https://ajyalona.org.ly/${playList.playlists[index].image}",
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        height(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              text: playList.playlists[index].arTitle,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.ktextColor,
                            ),
                            Row(
                              children: [
                                DefaultText(
                                  text:
                                      "${S.current.episodes}: ${playList.episodes.length.toString()}",
                                  color: AppColors.greyB9,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                                width(8),
                                SvgPicture.asset(AppAssets.listVideo)
                              ],
                            ),
                          ],
                        ),
                        height(16),
                        Row(
                          children: [
                            const Icon(Icons.share_outlined),
                            const SizedBox(width: 8.0),
                            DefaultText(
                              text: S.current.share,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        height(16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultText(
                                text: S.current.listenAt,
                                color: AppColors.red,
                              ),
                              SvgPicture.asset(AppAssets.sound).onTap(() async {
                                await launchUrlString(
                                    playList.episodes[index].soundLink);
                              }),
                              SvgPicture.asset(AppAssets.youtube)
                                  .onTap(() async {
                                await launchUrlString(
                                    playList.episodes[index].youtubeLink);
                              }),
                              SvgPicture.asset(AppAssets.spotify)
                                  .onTap(() async {
                                await launchUrlString(
                                    playList.episodes[index].spotifyLink);
                              }),
                              SvgPicture.asset(AppAssets.tiktok)
                                  .onTap(() async {
                                await launchUrlString(
                                    playList.episodes[index].titokLink);
                              }),
                            ],
                          ),
                        )
                      ],
                    ).onTap(() {
                      context.pushNamed(Routes.episodes, pathParameters: {
                        'id': playList.playlists[index].id.toString()
                      });
                    });
                  },
                ),
              ))
          };
        },
      ),
    );
  }
}


/**
 class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player with a video URL or asset
    _controller = VideoPlayerController.network(
      'https://www.example.com/sample-video.mp4', // Replace with your video URL or use `VideoPlayerController.asset` for local assets
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Player")),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(), // Show loading while the video initializes
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

 */