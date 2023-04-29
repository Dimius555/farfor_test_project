import 'package:farfor_test_project/configurations/localization/localization_notifier.dart';
import 'package:farfor_test_project/configurations/localization/localization_storage.dart';
import 'package:farfor_test_project/configurations/theme/theme_notifier.dart';
import 'package:farfor_test_project/configurations/theme/theme_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());
  sl.registerLazySingleton<ThemeStorage>(() => ThemeStorage(prefs: sl()));
  sl.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier(themeStorage: sl()));
  sl.registerLazySingleton<LocalizationStorage>(() => LocalizationStorage(prefs: sl()));
  sl.registerLazySingleton<LocalizationNotifier>(() => LocalizationNotifier(localizationStorage: sl()));
}
