import 'package:ageal/core/constants/app_assets.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/view/news/news_screen.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routing/routes.dart';
import '../paltform/new_generation_paltform_screen.dart';
import 'event_body.dart';

class EventsPage extends StatelessWidget {
  final String navigationSource;
  final int? index;
  const EventsPage({super.key, required this.navigationSource, this.index});

  @override
  Widget build(BuildContext context) {
    int initialIndex;
    switch (navigationSource) {
      case 'event':
        initialIndex = 0;
        break;
      case 'news':
        initialIndex = 1;
        break;
      case 'platfrom':
        initialIndex = 2;
        break;
      default:
        initialIndex = 1;
    }
    return CustomStackScaffold(
      body: DefaultTabController(
        initialIndex: initialIndex,
        length: 3,
        child: Column(
          children: [
            height(30),
            Row(
              children: [
                CustomArrowBack(
                  onPressed: () {
                    context.push(Routes.navBar);
                  },
                ),
                width(100),
                Image.asset(AppAssets.logo),
              ],
            ),
            height(16),
            TabBar(
                dividerColor: Colors.transparent,
                indicatorColor: AppColors.red,
                labelColor: AppColors.kprimaryColor,
                unselectedLabelColor: AppColors.kprimaryColor,
                unselectedLabelStyle: const TextStyle(
                    color: AppColors.kprimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                labelStyle: const TextStyle(
                    color: AppColors.kprimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                tabs: [
                  FittedBox(
                    child: DefaultText(
                        text: S.current.event,
                        color: AppColors.kprimaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  FittedBox(
                    child: DefaultText(
                        text: S.current.news,
                        color: AppColors.kprimaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  FittedBox(
                    child: DefaultText(
                        text: S.current.platform,
                        color: AppColors.kprimaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ]),
            const Expanded(
              child: TabBarView(children: [
                EventBody(),
                NewsScreen(),
                NewGenerationPaltformScreen(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
