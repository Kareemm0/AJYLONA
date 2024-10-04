import 'dart:ui';

abstract class AppState {}

class AppInitialState extends AppState {}

class ChangeLanguageState extends AppState {
  final Locale _locale;

  ChangeLanguageState(this._locale);

  @override
  Locale get locale => _locale;
}
