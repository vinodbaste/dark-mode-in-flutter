import 'package:flutter/material.dart';

final setLightTheme = _buildLightTheme();
final setDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.light,
      visualDensity: VisualDensity(horizontal: 2.0, vertical: 2.0),
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: Colors.white54,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
          .copyWith(secondary: Colors.black),
      iconTheme: IconThemeData(color: Colors.black87, size: 15.0, opacity: 10));
}

ThemeData _buildDarkTheme() {
  return ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      visualDensity: VisualDensity(horizontal: 2.0, vertical: 2.0),
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
          .copyWith(secondary: Colors.white),
      iconTheme: IconThemeData(color: Colors.white, size: 15.0, opacity: 10));
}
