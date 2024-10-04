import 'package:ageal/presentation/cubit/platform/playlist/play_list_cubit.dart';
import 'package:ageal/presentation/cubit/platform/playlist/play_list_state.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:ageal/presentation/widget/custom/custom_loading.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:ageal/presentation/widget/platform/custom_episodes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../dependency_injection.dart';

class EpisodesDetailsScreen extends StatelessWidget {
  final int id;
  const EpisodesDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = PlayListCubit(getIt());
    return BlocProvider.value(
      value: cubit..playList(),
      child:
          BlocBuilder<PlayListCubit, PlayListState>(builder: (context, state) {
        if (state is PlayListSuccessState) {
          final playList = state.playlistsAndEpisodes.playlists.firstWhere(
            (item) => item.id == id,
          );

          return CustomStackScaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomArrowBack(),
                      width(widthSize(context) * 0.3),
                      Image.asset(AppAssets.logo)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Image.network(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.18,
                      "https://ajyalona.org.ly/${playList.image}",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Expanded(
                    child: CustomEpisodes(),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const CustomStackScaffold(
            body: CustomLoading(),
          );
        }
      }),
    );
  }
}
