import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTabBarHome extends StatefulWidget {
  const CustomTabBarHome({super.key});

  @override
  State<CustomTabBarHome> createState() => _CustomTabBarHomeState();
}

class _CustomTabBarHomeState extends State<CustomTabBarHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {'title': S.current.event, 'color': AppColors.kprimaryColor},
      {'title': S.current.news, 'color': AppColors.red},
      {'title': S.current.platform, 'color': AppColors.greyB9},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(tabs.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              selectedIndex == 0
                  ? context.push(Routes.events, extra: 'event')
                  : selectedIndex == 1
                      ? context.push(Routes.events, extra: 'news')
                      : selectedIndex == 2
                          ? context.push(Routes.events, extra: 'platfrom')
                          : null;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            padding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            decoration: BoxDecoration(
              color: tabs[index]['color'],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DefaultText(
              text: tabs[index]['title'],
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }),
    );
  }
}
