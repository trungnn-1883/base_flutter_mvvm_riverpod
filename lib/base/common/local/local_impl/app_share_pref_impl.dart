import 'package:flutter_mvvm_riverpod/base/common/local/app_share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharePrefImpl extends AppSharePref {
  // Singleton instance
  static final AppSharePrefImpl _instance = AppSharePrefImpl._internal();

  // Expose the singleton instance
  static AppSharePrefImpl get instance => _instance;

  // Private named constructor
  AppSharePrefImpl._internal();

  final String _isAppTutorialShownKey = 'isAppTutorialShown';
  final String _preferredLanguageCodeKey = 'preferredLanguageCode';
  final String _isFirstLaunchKey = 'isFirstLaunch';

  Future<void> _setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> _setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<void> _setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<String?> _getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool?> _getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<int?> _getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  @override
  Future<String?> getPreferredLanguageCode() async {
    return await _getString(_preferredLanguageCodeKey);
  }

  @override
  Future<void> setPreferredLanguageCode(String? languageCode) async {
    if (languageCode != null) {
      await _setString(_preferredLanguageCodeKey, languageCode);
    }
  }

  @override
  Future<bool> isAppTutorialShown() async {
    return await _getBool(_isAppTutorialShownKey) ?? false;
  }

  @override
  Future<void> setAppTutorialShown(bool isShown) async {
    await _setBool(_isAppTutorialShownKey, isShown);
  }

  @override
  Future<bool> isFirstLaunch() async {
    return await _getBool(_isFirstLaunchKey) ?? true;
  }

  @override
  Future<void> setFirstLaunch(bool isFirstLaunch) async {
    await _setBool(_isFirstLaunchKey, isFirstLaunch);
  }
}
