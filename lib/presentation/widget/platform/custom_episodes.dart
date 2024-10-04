import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/cubit/platform/episodes/episodes_cubit.dart';
import 'package:ageal/presentation/cubit/platform/episodes/episodes_state.dart';
import 'package:ageal/presentation/widget/custom/custom_loading.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../custom/app_text.dart';

class CustomEpisodes extends StatelessWidget {
  const CustomEpisodes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EpisodesCubit(getIt())..episodes(),
      child: BlocBuilder<EpisodesCubit, EpisodesState>(
        builder: (context, state) {
          return switch (state) {
            EpisodesInitialState() =>
              const CustomStackScaffold(body: CustomLoading()),
            EpisodeLoadingState() =>
              const CustomStackScaffold(body: CustomLoading()),
            EpisodesFailurState(errorMessage: final message) => Center(
                child: DefaultText(
                  text: message,
                  color: AppColors.kprimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            EpisodesSuccessState(entity: final episodes) => CustomStackScaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => height(8),
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: episodes.episodes!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.kprimaryColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                    ),
                                    child: Image.network(
                                      "https://ajyalona.org.ly/${episodes.playlist!.image}", // Replace with your image URL
                                      height: 200.0,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SvgPicture.asset(AppAssets.play).onTap(() {
                                    launchUrlString(
                                        "${episodes.episodes![index].video}");
                                  })
                                ],
                              ),
                              height(8),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultText(
                                          text:
                                              "${S.current.episode} :  ${episodes.episodes![index].number}",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.red,
                                        ),
                                        width(16),
                                        DefaultText(
                                          text: episodes
                                              .episodes![index].arTitle!,
                                          color: AppColors.kprimaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        DefaultText(
                                          text: episodes.episodes![index].time!,
                                          color: AppColors.greyB95,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                        SvgPicture.asset(AppAssets.date),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 8.0),
                                child: Row(
                                  children: [
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: DefaultText(
                                  text:
                                      episodes.episodes![index].arDescription!,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DefaultText(
                                      text: S.current.listenAt,
                                      color: AppColors.red,
                                    ),
                                    SvgPicture.asset(AppAssets.sound)
                                        .onTap(() async {
                                      await launchUrlString(
                                          episodes.episodes![index].soundLink!);
                                    }),
                                    SvgPicture.asset(AppAssets.youtube)
                                        .onTap(() async {
                                      await launchUrlString(episodes
                                          .episodes![index].youtubeLink!);
                                    }),
                                    SvgPicture.asset(AppAssets.spotify)
                                        .onTap(() async {
                                      await launchUrlString(episodes
                                          .episodes![index].spotifyLink!);
                                    }),
                                    SvgPicture.asset(AppAssets.tiktok)
                                        .onTap(() async {
                                      await launchUrlString(
                                          episodes.episodes![index].titokLink!);
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
          };
        },
      ),
    );
  }
}
