import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static SharedPreferences? _sharedPreferences;

  static init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static putInteger(String key, int value) {
    if (_sharedPreferences != null) _sharedPreferences!.setInt(key, value);
  }

  static int getInteger(String key) {
    return _sharedPreferences == null
        ? 0
        : _sharedPreferences!.getInt(key) ?? 0;
  }

  static putString(String key, String value) {
    if (_sharedPreferences != null) _sharedPreferences!.setString(key, value);
  }

  static String getString(String key) {
    return _sharedPreferences == null
        ? 'DEFAULT_VALUE'
        : _sharedPreferences!.getString(key) ?? "";
  }

  static putBool(String key, bool value) {
    if (_sharedPreferences != null) _sharedPreferences!.setBool(key, value);
  }

  static bool getBool(String key) {
    return _sharedPreferences == null
        ? false
        : _sharedPreferences!.getBool(key) ?? false;
  }

  static clear() {
    if (_sharedPreferences != null) _sharedPreferences!.clear();
  }
}
