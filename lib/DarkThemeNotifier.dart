import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class that contains all your app settings
/// Consists only of Theme setting as of now
class DarkThemeNotifier extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  DarkThemeNotifier(this.sharedPreferences);

  bool get isDarkMode => sharedPreferences?.getBool("isDarkMode") ?? false;

  void setDarkMode(bool val) {
    sharedPreferences?.setBool("isDarkMode", val);
    notifyListeners();
  }
}