import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpers {
  static const String tokenKey = 'AuthToken';

  // Save token to SharedPreferences
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  // retrieve token from SharedPrefrences
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey) ?? '';
  }

  // Remove token from SharedPreferences
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }

  // check if token exists in SharedPreferences
  static Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(tokenKey);
  }
}
