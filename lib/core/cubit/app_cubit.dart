import 'package:ageal/core/cubit/app_state.dart';
import 'package:ageal/core/shared/shared_prefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  AppSharedPrefrences? appSharedPrefrences;

  void changeLanguage(int index) {
    final locale = index == 0 ? const Locale('ar') : const Locale('en');
    emit(ChangeLanguageState(locale));
    S.load(locale);
  }

  void saveLanguage(int languageIndex) async {
    await AppSharedPrefrences().init();
    await AppSharedPrefrences().setInt('languageIndex', languageIndex);
  }

  Future<int?> getLanguage() async {
    await AppSharedPrefrences().init();
    return AppSharedPrefrences().getInt('languageIndex');
  }
}
