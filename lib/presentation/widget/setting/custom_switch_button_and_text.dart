import 'package:ageal/presentation/cubit/setting/setting_cubit.dart';
import 'package:ageal/presentation/cubit/setting/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../generated/l10n.dart';
import '../custom/app_text.dart';

class CustomSwitchButtonAndText extends StatelessWidget {
  const CustomSwitchButtonAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        final cubit = context.read<SettingCubit>();
        return Row(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14159),
              child: Switch(
                  activeColor: AppColors.switchColor,
                  thumbColor: const WidgetStatePropertyAll(AppColors.blue25),
                  value: cubit.isChecked,
                  onChanged: (val) {
                    cubit.switchButton(val);
                  }),
            ),
            width(8),
            DefaultText(
              text:
               S.of(context).openNotifi,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            )
          ],
        );
      },
    );
  }
}
