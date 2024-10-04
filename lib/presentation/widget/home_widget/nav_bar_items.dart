import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/cubit/nav_bar/cubit/nav_bar_items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarItems extends StatelessWidget {
  const NavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarItemsCubit(),
      child: Scaffold(body: BlocBuilder<NavBarItemsCubit, int>(
        builder: (context, state) {
          final cubit = context.read<NavBarItemsCubit>();
          return cubit.pages[state];
        },
      ), bottomNavigationBar:
          BlocBuilder<NavBarItemsCubit, int>(builder: (context, state) {
        return BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: state,
          onTap: (index) {
            context.read<NavBarItemsCubit>().setPage(index);
          },
          selectedItemColor: AppColors.kprimaryColor,
          unselectedItemColor: AppColors.grey82,
          selectedIconTheme: const IconThemeData(size: 30),
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.newspaper,
              ),
              label: S.of(context).news,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.search,
              ),
              label: S.of(context).search,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.video_call,
              ),
              label: S.of(context).video,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              label: S.of(context).settings,
            ),
          ],
        );
      })),
    );
  }
}
