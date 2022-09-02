import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:tesis_1/app/domain/repositories/preferences_repository.dart';

class ThemeController extends SimpleNotifier {
  late ThemeMode _mode;

  ThemeController() {
    _mode = _preferences.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
  final PreferencesRepository _preferences = Get.find();
  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;
  void toggle() {
    if (_mode == ThemeMode.light) {
      _mode = ThemeMode.dark;
      _preferences.darkMode(true);
    } else {
      _mode = ThemeMode.light;
      _preferences.darkMode(false);
    }
    notify();
  }
}

final themeProvider = SimpleProvider(
  (_) => ThemeController(),
  autoDispose: false,
);
