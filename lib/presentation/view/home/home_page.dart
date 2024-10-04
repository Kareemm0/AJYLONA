import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/cubit/home/home_cubit.dart';
import 'package:ageal/presentation/widget/auth_widget/custom_text_from_filed.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:ageal/presentation/widget/home_widget/custom_plat_form_work.dart';
import 'package:ageal/presentation/widget/home_widget/custom_viedo_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../widget/home_widget/custom_banner.dart';
import '../../widget/home_widget/custom_community_card.dart';
import '../../widget/home_widget/custom_home_shimmer.dart';
import '../../widget/home_widget/custom_news_item_card.dart';
import '../../widget/home_widget/custom_tab_bar_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomStackScaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => HomeCubit(homeRepo: getIt())..getHome(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return switch (state) {
                HomeInitial() || HomeLoading() => const CustomHomeShimmer(),
                HomeFailure(message: final message) => Center(
                    child: DefaultText(
                        text: message,
                        color: AppColors.kprimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16)),
                HomeSuccess(homeEntity: final data) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        CustomTextFromFiled(
                          controller: TextEditingController(),
                          hintText: S.of(context).search,
                          fillColor: AppColors.greyE0,
                          prefixIcon: const Icon(Icons.search),
                        ),
                        height(16),
                        const CustomTabBarHome(),
                        height(16),
                        DefaultText(
                          text: S.of(context).events,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.ktextColor,
                        ),
                        height(16),
                        const CustomViedoPlayerWidget(),
                        height(16),
                        CustomBanner(
                          src:
                              "https://ajyalona.org.ly/${data.adverticement!.image}",
                        ),
                        height(16),
                        DefaultText(
                          text: S.current.news,
                          color: AppColors.kprimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomNewsItemCard(
                          newsEntity: data.news ?? [],
                        ),
                        Row(
                          children: [
                            DefaultText(
                              text: S.current.platform_work,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.ktextColor,
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              AppAssets.microphone,
                            ),
                          ],
                        ),
                        height(10),
                        CustomPlatFormWork(
                          onPressed: () {
                            context.push(Routes.events, extra: 'platfrom');
                          },
                          title: S.current.podcast,
                          image: AppAssets.pod,
                        ),
                        height(12),
                        DefaultText(
                          text: S.current.about_community,
                          color: AppColors.kprimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        height(12),
                        CustomCommunityCard(
                          communityImage: AppAssets.aboutCommunityPic,
                          communityTitle: S.current.aboutus,
                          communityBody: S.current.aboutusbody,
                        )
                      ])
              };
            },
          ),
        ),
      ),
    ));
  }
}
