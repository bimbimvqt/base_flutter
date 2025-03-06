import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_dark.dart';
import 'app_theme_light.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkMode;
  bool _isDarkMode = true;
  late SharedPreferences _prefs;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool get getIsDarkMode => _isDarkMode;

  Future<void> toggleTheme() async {
    setThemeMode();
  }

  Future<void> setThemeMode() async {
    await _prefs.setBool("isDarkMode", !_isDarkMode);
    themeData = _isDarkMode ? lightMode : darkMode;
    _isDarkMode = !_isDarkMode;
  }

  Future<void> setInitTheme() async {
    _prefs = await SharedPreferences.getInstance();
    _isDarkMode = _prefs.getBool('isDarkMode') ?? true;
    themeData = _isDarkMode ? darkMode : lightMode;
  }
}

// ThemeProvider themeManager = ThemeProvider();

// ThemeData get Theme.of(context) {
//   return themeManager._themeData;
// }
