import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/dependency_injection.dart';
import 'package:ageal/presentation/cubit/home/home_cubit.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:ageal/presentation/widget/custom/custom_arrow_forward.dart';
import 'package:ageal/presentation/widget/custom/custom_stack_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreEventsScreen extends StatelessWidget {
  const MoreEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit(homeRepo: getIt())..getHome();
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return CustomStackScaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomArrowBack(),
                      height(24),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          "https://ajyalona.org.ly/${state.homeEntity.adverticement!.image!}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      height(16),
                      DefaultText(
                        text: state.homeEntity.adverticement!.arTitle!,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      height(16),
                      DefaultText(
                        text: state.homeEntity.adverticement!.arContent!,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        maxLines: 100,
                        color: AppColors.greyB9,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
