import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/presentation/cubit/register/register_cubit.dart';
import 'package:ageal/presentation/cubit/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../generated/l10n.dart';
import '../custom/app_text.dart';
import '../custom/custom_radio_button.dart';

class CustomGenderRow extends StatelessWidget {
  const CustomGenderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Row(
          children: [
            Row(
              children: [
                DefaultText(
                  text: S.of(context).male,
                  color: AppColors.grey66,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                CustomRadioButton(
                  value: "ذكر",
                  groupValue: cubit.selectedOption,
                  onChanged: (val) {
                    cubit.changeGender(val);
                  },
                ),
              ],
            ),
            width(16),
            Row(
              children: [
                DefaultText(
                  text: S.of(context).female,
                  color: AppColors.grey66,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                CustomRadioButton(
                  value: "انثي",
                  groupValue: cubit.selectedOption,
                  onChanged: (val) {
                    cubit.changeGender(val);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
