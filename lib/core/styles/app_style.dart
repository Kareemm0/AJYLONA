import 'package:ageal/core/constants/app_colors.dart';
import 'package:ageal/core/constants/out_line_boder.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static ThemeData themeData() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: AppColors.grey9c,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: outLineInputBorder(),
        disabledBorder: outLineInputBorder(),
        errorBorder: outLineInputBorder(),
        focusedErrorBorder: outLineInputBorder(),
        enabledBorder: outLineInputBorder(),
        filled: true,
        fillColor: AppColors.white,
      ),
      fontFamily: 'JannaLT',
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }
}
