import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefrences {
  static final AppSharedPrefrences _instance = AppSharedPrefrences.internal();

  late SharedPreferences _sharedPreferences;

  AppSharedPrefrences.internal();

  factory AppSharedPrefrences() => _instance;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  String? getString(String key) => _sharedPreferences.getString(key);
  Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  bool? getBool(String key) => _sharedPreferences.getBool(key);
  Future<void> setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  int? getInt(String key) => _sharedPreferences.getInt(key);
}
