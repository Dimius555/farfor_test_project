import 'package:dio/dio.dart';
import 'package:farfor_test_project/configurations/dio_provider/dio_provider.dart';
import 'package:farfor_test_project/configurations/interfaces/basket_repository.dart';
import 'package:farfor_test_project/configurations/interfaces/restaurant_repository.dart';
import 'package:farfor_test_project/configurations/interfaces/sales_repository.dart';
import 'package:farfor_test_project/configurations/localization/localization_notifier.dart';
import 'package:farfor_test_project/configurations/localization/localization_storage.dart';
import 'package:farfor_test_project/configurations/theme/theme_notifier.dart';
import 'package:farfor_test_project/configurations/theme/theme_storage.dart';
import 'package:farfor_test_project/data/local_data_source/basket_data_source.dart';
import 'package:farfor_test_project/data/local_data_source/sales_data_source.dart';
import 'package:farfor_test_project/data/remote_data_source/resturant_api.dart';
import 'package:farfor_test_project/domain/basket_repository.dart';
import 'package:farfor_test_project/domain/restaurant_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/sales_repository_impl.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerSingletonAsync(() async => await SharedPreferences.getInstance());
  sl.registerLazySingleton<ThemeStorage>(() => ThemeStorage(prefs: sl()));
  sl.registerLazySingleton<SalesDataSource>(() => SalesDataSource(prefs: sl()));
  sl.registerLazySingleton<LocalizationStorage>(() => LocalizationStorage(prefs: sl()));
  sl.registerLazySingleton<BasketDataSource>(() => BasketDataSource(prefs: sl()));

  sl.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier(themeStorage: sl()));
  sl.registerLazySingleton<LocalizationNotifier>(() => LocalizationNotifier(localizationStorage: sl()));

  sl.registerLazySingleton<Dio>(() => DioProvider().get());
  sl.registerLazySingleton<RestaurantAPI>(() => RestaurantAPI(sl()));

  sl.registerLazySingleton<RestaurantRepository>(() => ResturantRepositoryImpl(api: sl()));
  sl.registerLazySingleton<SalesRepository>(() => SalesRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<BasketRepository>(() => BasketRepositoryImpl(dataSource: sl()));
}
