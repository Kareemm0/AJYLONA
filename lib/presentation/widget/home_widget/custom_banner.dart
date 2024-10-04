import 'package:ageal/app/routing/routes.dart';
import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/widget/custom/deaful_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBanner extends StatelessWidget {
  final String src;
  const CustomBanner({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.sizeOf(context).height * 0.23,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  src,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                child: DeafultButton(
                  title: S.current.more,
                  onPressed: () {
                    context.push(Routes.moreEvent);
                  },
                  borderColor: AppColors.red,
                  containerColor: AppColors.red,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
