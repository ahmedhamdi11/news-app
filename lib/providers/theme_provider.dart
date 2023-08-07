import 'package:flutter/material.dart';
import 'package:news_app/utils/cache_helper.dart';

class ThemeProvider with ChangeNotifier {
  late bool isDarkTheme;

  toggleTheme() {
    isDarkTheme = !isDarkTheme;
    CacheHelper.prefs.setBool('isDarkTheme', isDarkTheme);
    notifyListeners();
  }

  getThemeFromPrefs() {
    isDarkTheme = CacheHelper.prefs.getBool('isDarkTheme') ?? false;
  }
}
