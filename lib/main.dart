import 'package:easy_localization/easy_localization.dart';
import 'package:farfor_test_project/configurations/localization/localization_notifier.dart';
import 'package:farfor_test_project/configurations/navigation/page_manager.dart';
import 'package:farfor_test_project/configurations/theme/theme_notifier.dart';
import 'package:farfor_test_project/service_locator.dart';
import 'package:farfor_test_project/views/blocs/basket_bloc/basket_bloc.dart';
import 'package:farfor_test_project/views/blocs/dishes_bloc/dishes_bloc.dart';
import 'package:farfor_test_project/views/blocs/sales_bloc/sales_bloc.dart';
import 'package:farfor_test_project/views/pages/app_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'configurations/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  initServiceLocator();
  await sl.allReady();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale.fromSubtags(languageCode: 'ru'),
        Locale.fromSubtags(languageCode: 'en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale.fromSubtags(languageCode: 'ru'),
      child: const AppSetup(),
    ),
  );
}

class AppSetup extends StatelessWidget {
  const AppSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PageManager(),
        ),
        BlocProvider(
          create: (_) => DishesBloc(restaurantRepository: sl())..add(LoadDishes()),
        ),
        BlocProvider(
          create: (_) => BasketBloc(),
        ),
        BlocProvider(
          create: (_) => SalesBloc(salesRepository: sl())..add(FetchSalesEvent()),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => sl<ThemeNotifier>()),
          ChangeNotifierProvider(create: (_) => sl<LocalizationNotifier>()),
        ],
        builder: (context, child) {
          final isDarkMode = context.watch<ThemeNotifier>().isDarkMode;
          return MaterialApp(
            title: 'Farfor Delivery',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const AppPage(),
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          );
        });
  }
}
