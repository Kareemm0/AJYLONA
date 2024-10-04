import 'package:ageal/core/constants/app_shared_prefrence_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageManager {
  Future<int?> getLanguageIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(AppSharedPrefrencesKeys.lan);
  }

  Future<void> setLanguageIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(AppSharedPrefrencesKeys.lan, index);
  }
}
