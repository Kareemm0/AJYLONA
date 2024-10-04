import 'package:ageal/presentation/cubit/platfrom/new_generation_cubit.dart';
import 'package:ageal/presentation/cubit/platfrom/new_generation_state.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../generated/l10n.dart';
import '../../widget/platform/custom_episodes.dart';
import '../../widget/platform/custom_playlists.dart';
import '../../widget/platform/custom_row_two_tabs.dart';

class NewGenerationPaltformScreen extends StatelessWidget {
  const NewGenerationPaltformScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewGenerationCubit(),
      child: BlocBuilder<NewGenerationCubit, NewGenerationState>(
        builder: (context, state) {
          final cubit = context.read<NewGenerationCubit>();
          return CustomStackScaffold(
              body: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Row(
                        children: [
                          SvgPicture.asset(AppAssets.microphone),
                          width(8),
                          DefaultText(
                            text: S.current.platform,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kprimaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  width(8),
                  Flexible(
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomRowTwoTabs(
                            index: 0,
                            assetName: AppAssets.video,
                            text: S.current.episodes,
                            isSelected: cubit.selectedIndex == 0,
                            onTap: () => cubit.onTabTapped(0),
                          ),
                          width(16),
                          CustomRowTwoTabs(
                            index: 1,
                            assetName: AppAssets.listVideo,
                            text: S.current.playlists,
                            isSelected: cubit.selectedIndex == 1,
                            onTap: () => cubit.onTabTapped(1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: cubit.selectedIndex == 0
                  ? const CustomEpisodes()
                  : const CustomPlaylists(),
            ),
          ]));
        },
      ),
    );

    //   body:

    //     },
    //   ),
    // );
  }
}
