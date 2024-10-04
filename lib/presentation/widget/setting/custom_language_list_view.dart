import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/cubit/app_cubit.dart';
import 'package:ageal/presentation/cubit/setting/setting_cubit.dart';
import 'package:ageal/presentation/cubit/setting/setting_state.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/languages.dart';

class CustomLanguageListView extends StatelessWidget {
  const CustomLanguageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(builder: (context, state) {
      final appCubit = context.read<AppCubit>();
      final cubit = context.read<SettingCubit>();

      return Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: languages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        cubit.changeIndex(index);
                        appCubit.changeLanguage(index);
                        appCubit.saveLanguage(index);
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.30,
                        height: MediaQuery.sizeOf(context).height * 0.50,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: cubit.currentIndex == index
                                  ? AppColors.kprimaryColor
                                  : AppColors.white,
                            )),
                        child: Align(
                          alignment: Alignment.center,
                          child: DefaultText(
                            text: languages[index].text,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: cubit.currentIndex == index
                                ? AppColors.kprimaryColor
                                : AppColors.red,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
