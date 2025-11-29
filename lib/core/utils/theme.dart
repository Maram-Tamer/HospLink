import 'package:flutter/material.dart';
import 'package:medigo/core/constatnts/fonts.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blueLight,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppFontStyles.getSize24(fontColor: AppColors.blackColor),
      backgroundColor: AppColors.blueLight,
      foregroundColor: AppColors.primaryGreenColor,
      surfaceTintColor: Colors.transparent,
    ),
    fontFamily: AppFonts.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkColor,
      onSurface: AppColors.darkColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryGreenColor,
      unselectedItemColor: AppColors.greyColor,
      showSelectedLabels: false,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            BorderSide(color: AppColors.slateGrayColor.withAlpha(50), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryGreenColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.greyColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppFontStyles.getSize24(fontColor: AppColors.whiteColor),
      backgroundColor: AppColors.greyColor,
      foregroundColor: AppColors.primaryGreenColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    fontFamily: AppFonts.fontFamily,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryGreenColor,
      onPrimary: AppColors.whiteColor,
      background: AppColors.greyColor,
      onBackground: AppColors.whiteColor,
      surface: AppColors.greyColor,
      onSurface: AppColors.whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.greyColor,
      selectedItemColor: AppColors.primaryGreenColor,
      unselectedItemColor: AppColors.greyColor,
      showSelectedLabels: false,
      showUnselectedLabels: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.greyColor,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: AppColors.slateGrayColor.withAlpha(100), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryGreenColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    ),
  );
}
