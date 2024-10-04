import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/cubit/setting/setting_cubit.dart';
import 'package:ageal/presentation/cubit/setting/setting_state.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../widget/auth_widget/custom_add_profile_stack.dart';
import '../../widget/setting/custom_language_list_view.dart';
import '../../widget/setting/custom_row_title_and_icons.dart';
import '../../widget/setting/custom_switch_button_and_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return CustomStackScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomArrowBack(
                        onPressed: () {
                          context.push(Routes.navBar);
                        },
                      ),
                      width(90),
                      DefaultText(
                        text: S.current.settings,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ],
                  ),
                  height(32),
                  const CustomAddProfileStack(
                    personIcon: Icon(
                      Icons.person_outline,
                      size: 80,
                    ),
                    containerColor: AppColors.greyD9,
                    borderColor: AppColors.greyD9,
                    iconColor: AppColors.kprimaryColor,
                    iconBorderColor: AppColors.transparent,
                  ),
                  height(16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.shadwoColor,
                              blurRadius: 2,
                              spreadRadius: 4,
                              offset: Offset(0, 4))
                        ],
                        border: Border.all(color: AppColors.white),
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white),
                    child: const CustomLanguageListView(),
                  ),
                  height(32),
                  const CustomSwitchButtonAndText(),
                  height(32),
                  const CustomRowTitleAndIcons()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
