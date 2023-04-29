import 'package:easy_localization/easy_localization.dart';
import 'package:farfor_test_project/configurations/localization/localization_notifier.dart';
import 'package:farfor_test_project/configurations/router/app_router.dart';
import 'package:farfor_test_project/configurations/theme/theme_notifier.dart';
import 'package:farfor_test_project/service_locator.dart';
import 'package:flutter/material.dart';
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
    return const MainApp();
    // MultiBlocProvider(
    //   providers: const [],
    //   child: const MainApp(),
    // );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => sl<ThemeNotifier>()),
          ChangeNotifierProvider(create: (_) => sl<LocalizationNotifier>()),
        ],
        builder: (context, child) {
          final isDarkMode = context.watch<ThemeNotifier>().isDarkMode;

          return MaterialApp.router(
            title: 'Farfor Delivery',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            routeInformationParser: appRouter.router.routeInformationParser,
            routerDelegate: appRouter.router.routerDelegate,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          );
        });
  }
}
