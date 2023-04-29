import 'package:flutter/material.dart';

part 'app_colors.dart';

class AppTheme {
  AppTheme({this.brightness = Brightness.light});

  final Brightness brightness;

  static ThemeData lightTheme() => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightModeColors.primaryBackgroundColor,
      dividerColor: const Color(0xFFF1F4F9),
      appBarTheme: const AppBarTheme(elevation: 0));

  static ThemeData darkTheme() => ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: DarkModeColors.primaryBackgroundColor,
      dividerColor: const Color(0xFFF1F4F9),
      appBarTheme: const AppBarTheme(elevation: 0));

  static AppTheme read(BuildContext context) {
    return AppTheme(brightness: Theme.of(context).brightness);
  }

  bool get isDarkTheme => brightness == Brightness.dark;

  Color get primaryBackgroundColor => isDarkTheme ? DarkModeColors.primaryBackgroundColor : LightModeColors.primaryBackgroundColor;
  Color get secondaryBackgroundColor => isDarkTheme ? DarkModeColors.secondaryBackgroundColor : LightModeColors.secondaryBackgroundColor;
  Color get notchColor => isDarkTheme ? DarkModeColors.notchColor : LightModeColors.notchColor;
  Color get bottomNavigationItemSelectedColor =>
      isDarkTheme ? DarkModeColors.bottomNavigationItemSelectedColor : LightModeColors.bottomNavigationItemSelectedColor;
  Color get bottomNavigationItemUnselectedColor =>
      isDarkTheme ? DarkModeColors.bottomNavigationItemUnselectedColor : LightModeColors.bottomNavigationItemUnselectedColor;
  Color get shadowColor => isDarkTheme ? DarkModeColors.shadowColor.withOpacity(0.1) : LightModeColors.shadowColor.withOpacity(0.1);
  Color get accentPositiveColor => isDarkTheme ? DarkModeColors.accentPositiveColor : LightModeColors.accentPositiveColor;
  Color get accentWarningColor => isDarkTheme ? DarkModeColors.accentWarningColor : LightModeColors.accentWarningColor;
  Color get accentNegativeColor => isDarkTheme ? DarkModeColors.accentNegativeColor : LightModeColors.accentNegativeColor;

  Color get textPrimaryColor => isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor;
  Color get textSecondaryColor => isDarkTheme ? DarkModeColors.textSecondaryColor : LightModeColors.textSecondaryColor;
  Color get appAccentColor => isDarkTheme ? DarkModeColors.appAccentColor : LightModeColors.appAccentColor;

  TextStyle get headline1 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  //TODO: нет headline2 в фигме

  TextStyle get headline3 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get headline4 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get caption1 => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'raleway_semiBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get regular1 => TextStyle(
        fontSize: 22,
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
        fontWeight: FontWeight.w600,
        fontFamily: 'raleway_regular',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );

  TextStyle get button1 => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        fontFamily: 'raleway_extraBold',
        color: isDarkTheme ? DarkModeColors.textPrimaryColor : LightModeColors.textPrimaryColor,
      );
}
