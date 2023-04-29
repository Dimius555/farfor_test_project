import 'package:shared_preferences/shared_preferences.dart';

enum SupportedLocalizations { ru, en }

/// Локальное хранилище данных локализации.
class LocalizationStorage {
  final SharedPreferences prefs;

  const LocalizationStorage({
    required this.prefs,
  });

  static const String _key = 'localization';

  Future<void> setLocalization(SupportedLocalizations value) async {
    switch (value) {
      case SupportedLocalizations.en:
        await prefs.setString(_key, 'en');
        break;
      case SupportedLocalizations.ru:
        await prefs.setString(_key, 'ru');
        break;
    }
  }

  SupportedLocalizations getLocalization() {
    final localization = prefs.getString(_key) ?? 'en';
    if (localization == 'en') {
      return SupportedLocalizations.en;
    } else {
      return SupportedLocalizations.ru;
    }
  }
}
