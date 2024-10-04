abstract class SettingState {}

class SettingInitialState extends SettingState {}

class ChangeIndexSuccess extends SettingState {
  final int currentIndex;

  ChangeIndexSuccess({required this.currentIndex});
}

class ChangeSwitchButtonState extends SettingState {}

class SettingLoadIndexState extends SettingState {
  final int index;

  SettingLoadIndexState(this.index);
}
