import 'package:farfor_test_project/configurations/theme/theme_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Оповещение переключения между светлой и тёмной темой.
class ThemeNotifier extends ChangeNotifier {
  final ThemeStorage themeStorage;

  ThemeNotifier({required this.themeStorage}) {
    _initMode();
  }

  // Dark mode
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void switchTheme({bool? isDarkMode}) async {
    if (isDarkMode != null) {
      await themeStorage.setIsDarkMode(isDarkMode);
      _isDarkMode = isDarkMode;
    } else {
      _isDarkMode = !this.isDarkMode;
      await themeStorage.setIsDarkMode(_isDarkMode);
    }

    notifyListeners();
  }

  void _initMode() async {
    _isDarkMode = themeStorage.getIsDarkMode();
    notifyListeners();
  }
}
