import 'package:shared_preferences/shared_preferences.dart';

/// Локальное хранилище данных тёмной темы.
class ThemeStorage {
  final SharedPreferences prefs;

  const ThemeStorage({
    required this.prefs,
  });

  static const String _isDarkMode = 'darkMode_isDarkMode';

  Future<bool> setIsDarkMode(bool value) async {
    return await prefs.setBool(_isDarkMode, value);
  }

  bool getIsDarkMode() {
    return prefs.getBool(_isDarkMode) ?? false;
  }

  Future<bool> removeIsDarkMode() async {
    return await prefs.remove(_isDarkMode);
  }
}
