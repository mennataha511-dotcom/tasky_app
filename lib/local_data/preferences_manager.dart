import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static final PreferencesManager _instance = PreferencesManager._internal();

  PreferencesManager._internal();

  factory PreferencesManager() => _instance;

  late final SharedPreferences _preferences;

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  getBool(String key) {
    return _preferences.getBool(key);
  }
}
