import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'localization_storage.dart';

/// Оповещение переключения между локализациями.
class LocalizationNotifier extends ChangeNotifier {
  final LocalizationStorage localizationStorage;

  LocalizationNotifier({required this.localizationStorage}) {
    _initLocale();
  }

  SupportedLocalizations _currentLocalization = SupportedLocalizations.en;
  SupportedLocalizations get currentLocalization => _currentLocalization;

  void setNewLocalization({required SupportedLocalizations localization}) async {
    await localizationStorage.setLocalization(localization);
    _currentLocalization = localization;

    notifyListeners();
  }

  void _initLocale() async {
    _currentLocalization = localizationStorage.getLocalization();
    notifyListeners();
  }
}
