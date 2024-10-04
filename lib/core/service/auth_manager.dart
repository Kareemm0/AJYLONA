import 'package:ageal/core/constants/app_shared_prefrence_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationManager {
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppSharedPrefrencesKeys.tokenKey);
  }

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppSharedPrefrencesKeys.tokenKey, token);
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppSharedPrefrencesKeys.tokenKey);
  }
}
