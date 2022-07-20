import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _user = "user";

  static Future<String> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_user) ?? '';
  }

  static Future<bool> setUser(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_user, value);
  }
}
