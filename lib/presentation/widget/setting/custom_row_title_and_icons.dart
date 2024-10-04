import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_cubit.dart';
import 'package:ageal/presentation/cubit/edit_profile.dart/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../generated/l10n.dart';
import '../custom/app_text.dart';

class CustomRowTitleAndIcons extends StatelessWidget {
  const CustomRowTitleAndIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.person,
              color: AppColors.kprimaryColor,
            ),
            width(16),
            DefaultText(
              text: S.of(context).profile,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
                 BlocBuilder<UserDataCubit, UserDataState>(
                            builder: (context, state) {
                          if (state is GetDataSuccess) {
                            final userData = state.userData;
                            return IconButton(
                                onPressed: () {
                                  context.pushNamed(Routes.editProfile,
                                      extra: userData);
                                },
                                icon: const Icon(Icons.chevron_right));
                          } else {
                            return IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.chevron_right));
                          }
                        })
      ],
    );
  }
}
