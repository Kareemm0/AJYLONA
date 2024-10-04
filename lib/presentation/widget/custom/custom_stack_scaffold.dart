import 'package:ageal/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class CustomStackScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  final Widget? bottomNavBar;
  const CustomStackScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavBar,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: appBar,
          backgroundColor: AppColors.white,
          bottomNavigationBar: bottomNavBar,
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: AppColors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.scaffoldBacground),
              ),
            ),
            child: body,
          ),
          floatingActionButton: floatingActionButton,
        )
      ],
    );
  }
}
