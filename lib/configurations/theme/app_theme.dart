import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'app_colors.dart';

class AppTheme {
  AppTheme({this.brightness = Brightness.light});

  final Brightness brightness;

  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: LightModeColors.primaryBackgroundColor,
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
          centerTitle: true,
          backgroundColor: LightModeColors.primaryAppBarColor,
          elevation: 0,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
        ),
        colorScheme: const ColorScheme.light(
          onSecondary: Colors.white,
        ),
        textTheme: const TextTheme(),
      );

  static ThemeData darkTheme() => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: DarkModeColors.primaryBackgroundColor,
        dividerColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark),
          centerTitle: true,
          backgroundColor: DarkModeColors.primaryAppBarColor,
          elevation: 0,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      );

  static AppTheme read(BuildContext context) {
    return AppTheme(brightness: Theme.of(context).brightness);
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  Color get primaryBackgroundColor => isDarkTheme ? DarkModeColors.primaryBackgroundColor : LightModeColors.primaryBackgroundColor;
  Color get secondaryBackgroundColor => isDarkTheme ? DarkModeColors.secondaryBackgroundColor : LightModeColors.secondaryBackgroundColor;
  Color get primaryBackgroundInvertedColor => isDarkTheme ? LightModeColors.primaryBackgroundColor : DarkModeColors.primaryBackgroundColor;
  Color get primaryAppBarColor => isDarkTheme ? DarkModeColors.primaryAppBarColor : LightModeColors.primaryAppBarColor;
  Color get primaryCardBackgroundColor => isDarkTheme ? DarkModeColors.primaryCardBackgroundColor : LightModeColors.primaryCardBackgroundColor;
  Color get footerBackgroundColor => isDarkTheme ? DarkModeColors.footerBackgroundColor : LightModeColors.footerBackgroundColor;
  Color get shadowColor => isDarkTheme ? DarkModeColors.shadowColor : LightModeColors.shadowColor;
  Color get accentPositiveColor => isDarkTheme ? DarkModeColors.accentPositiveColor : LightModeColors.accentPositiveColor;
  Color get accentWarningColor => isDarkTheme ? DarkModeColors.accentWarningColor : LightModeColors.accentWarningColor;
  Color get accentNegativeColor => isDarkTheme ? DarkModeColors.accentNegativeColor : LightModeColors.accentNegativeColor;
  Color get linksColor => isDarkTheme ? DarkModeColors.textLinkColor : LightModeColors.textLinkColor;

  TextStyle get headline1 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        height: 24,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  //TODO: нет headline2 в фигме

  TextStyle get headline3 => TextStyle(
        fontSize: 16,
        height: 19.2,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get headline4 => TextStyle(
        fontSize: 14,
        height: 16.8,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get caption1 => TextStyle(
        fontSize: 12,
        height: 14.4,
        fontWeight: FontWeight.w600,
        fontFamily: 'raleway_semiBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular1 => TextStyle(
        fontSize: 22,
        height: 25.83,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_regular',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular2 => TextStyle(
        fontSize: 16,
        height: 19.2,
        fontWeight: FontWeight.w700,
        fontFamily: 'raleway_regular',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular3 => TextStyle(
        fontSize: 12,
        height: 14.4,
        fontWeight: FontWeight.w600,
        fontFamily: 'raleway_regular',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get button1 => TextStyle(
        fontSize: 16,
        height: 24,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );
}
