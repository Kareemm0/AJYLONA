import 'package:ageal/core/shared/shared_prefrence.dart';
import 'package:ageal/presentation/cubit/setting/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitialState());

  bool isChecked = false;
  AppSharedPrefrences prefrences = AppSharedPrefrences();

  int currentIndex = 0;

  Future<void> changeIndex(int newIndex) async {
    currentIndex = newIndex;
    await prefrences.setInt('languageIndex', newIndex);
    final index = prefrences.getInt('languageIndex');
    emit(ChangeIndexSuccess(currentIndex: index!));
    emit(ChangeIndexSuccess(currentIndex: newIndex));
  }

  void switchButton(bool val) {
    isChecked = val;
    emit(ChangeSwitchButtonState());
  }
}
