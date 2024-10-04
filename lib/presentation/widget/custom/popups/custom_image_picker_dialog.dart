import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/app_sizes.dart';
import 'package:ageal/core/extensions/extensions.dart';
import 'package:ageal/generated/l10n.dart';
import 'package:ageal/presentation/widget/custom/app_text.dart';
import 'package:flutter/material.dart';

void showImagePickerDialog(BuildContext ctx,
    {required String cameraText,
    required String galleryText,
    required void Function()? cameraOnTap,
    required void Function()? galleryOnTap}) {
  showDialog(
    context: ctx,
    builder: (ctx) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: heightSize(ctx) * 0.3,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DefaultText(
                text: S.of(ctx).chooseImageFrom,
                color: AppColors.grey66,
              ),
              const Spacer(),
              //! Gallery
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    text: galleryText,
                    color: AppColors.grey66,
                  ),
                  const Icon(
                    Icons.photo_library_outlined,
                    size: 32,
                    color: AppColors.kprimaryColor,
                  ),
                ],
              ).onTap(galleryOnTap),
              height(32),
              //! Camera
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                    text: cameraText,
                    color: AppColors.grey66,
                  ),
                  const Icon(
                    Icons.camera_outlined,
                    size: 32,
                    color: AppColors.kprimaryColor,
                  ),
                ],
              ).onTap(cameraOnTap),
              const Spacer(),
            ],
          ),
        ),
      );
    },
  );
}
