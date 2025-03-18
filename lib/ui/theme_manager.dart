// theme_manager.dart

import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static const _themeKey = 'themeMode';

  // Load theme from SharedPreferences
  static Future<String> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey) ?? 'system'; // Default to system theme
  }

  // Save theme to SharedPreferences
  static Future<void> saveTheme(String themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeKey, themeMode);
  }
}