import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/view/event/event_body.dart';
import 'package:ageal/presentation/view/news/news_screen.dart';
import 'package:ageal/presentation/view/paltform/new_generation_paltform_screen.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../widget/custom/app_text.dart';
import '../../widget/custom/custom_arrow_forward.dart';
import '../../widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomStackScaffold(
        body: DefaultTabController(
      length: 3,
      child: Column(
        children: [
          height(30),
          Row(
            children: [
              const CustomArrowBack(),
              width(100),
              Image.asset(AppAssets.logo),
            ],
          ),
          height(16),
          TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.red,
              labelColor: AppColors.blue25,
              unselectedLabelColor: AppColors.blue25,
              unselectedLabelStyle: const TextStyle(
                  color: AppColors.blue25,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              labelStyle: const TextStyle(
                  color: AppColors.blue25,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
              tabs: [
                DefaultText(
                    text: S.current.events,
                    color: AppColors.blue25,
                    fontWeight: FontWeight.w700),
                DefaultText(
                    text: S.current.news,
                    color: AppColors.blue25,
                    fontWeight: FontWeight.w700),
                DefaultText(
                    text: S.current.platform,
                    color: AppColors.kprimaryColor,
                    fontWeight: FontWeight.w700),
              ]),
          const Expanded(
            child: TabBarView(children: [
              EventBody(),
              NewsScreen(),
              NewGenerationPaltformScreen()
            ]),
          )
        ],
      ),
    ));
  }
}
