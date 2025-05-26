import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;
  static Future initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveAccessToken(String token) async {
    await _prefs.setString('spotify_access_token', token);
  }

  static Future<String?> getAccessToken() async {
    return _prefs.getString('spotify_access_token');
  }

  static Future<void> clearAccessToken() async {
    await _prefs.remove('spotify_access_token');
  }
}
