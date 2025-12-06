import 'package:flutter/material.dart';
import 'package:medigo/core/constatnts/fonts.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class AppTheme {
  // ---------------- LIGHT THEME ---------------- //
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.fontFamily,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryBlueColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.slateGrayColor,
      onSecondary: AppColors.darkColor,
      error: Colors.red.shade700,
      onError: AppColors.whiteColor,
      surface: AppColors.whiteColor,
      onSurface: AppColors.blackColor,
      surfaceContainerHighest: AppColors.slateGrayColor.withAlpha(40),
      onSurfaceVariant: AppColors.darkColor,
      outline: AppColors.slateGrayColor,
    ),

    scaffoldBackgroundColor: AppColors.blueLight,

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blueLight,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.primaryBlueColor,
      elevation: 0,
      titleTextStyle:
          AppFontStyles.getSize24(fontColor: AppColors.darkColor),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.primaryBlueColor,
      unselectedItemColor: AppColors.greyColor,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // -------- LIGHT THEME INPUT FIELD --------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor,

      // ⭐ NEW: Text color inside TextFormField
      hintStyle: TextStyle(color: AppColors.slateGrayColor),
      labelStyle: TextStyle(color: AppColors.darkColor),
      counterStyle: TextStyle(color: AppColors.darkColor),

      // ⭐ Prefix / Suffix Icons color
      prefixIconColor: AppColors.primaryBlueColor,
      suffixIconColor: AppColors.primaryBlueColor,

      // ⭐ Cursor Color
      // (This is needed because cursor uses primary automatically)
      // Cursor color from theme → good already

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.slateGrayColor.withAlpha(50),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryBlueColor,
          width: 1,
        ),
      ),
    ),

    // ⭐ NEW: text inside Input fields
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryBlueColor,
      selectionColor: AppColors.primaryBlueColor.withOpacity(0.3),
      selectionHandleColor: AppColors.primaryBlueColor,
    ),
  );

  // ---------------- DARK THEME ---------------- //
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.fontFamily,

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryBlueColor,
      onPrimary: AppColors.whiteColor,
      secondary: AppColors.inactiveDarkAccent,
      onSecondary: AppColors.primaryDarkText,
      error: Colors.red.shade400,
      onError: AppColors.primaryDarkText,
      surface: AppColors.darkCardSurface,
      onSurface: AppColors.primaryDarkText,
      surfaceContainerHighest: AppColors.inactiveDarkAccent,
      onSurfaceVariant: AppColors.primaryDarkText,
      outline: AppColors.inactiveDarkAccent,
    ),

    scaffoldBackgroundColor: AppColors.darkModeBackground,

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.darkCardSurface,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.primaryBlueColor,
      elevation: 0,
      titleTextStyle:
          AppFontStyles.getSize24(fontColor: AppColors.primaryDarkText),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkCardSurface,
      selectedItemColor: AppColors.primaryBlueColor,
      unselectedItemColor: AppColors.secondaryDarkText,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // -------- DARK THEME INPUT FIELD --------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkCardSurface,

      // ⭐ NEW: Text color inside TextFormField (DARK MODE)
      hintStyle: TextStyle(color: AppColors.secondaryDarkText),
      labelStyle: TextStyle(color: AppColors.secondaryDarkText),
      counterStyle: TextStyle(color: AppColors.primaryDarkText),

      // ⭐ Prefix / Suffix Icons color
      prefixIconColor: AppColors.primaryBlueColor,
      suffixIconColor: AppColors.primaryBlueColor,

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.inactiveDarkAccent,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryBlueColor,
          width: 1,
        ),
      ),
    ),

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryBlueColor,
      selectionColor: AppColors.primaryBlueColor.withOpacity(0.3),
      selectionHandleColor: AppColors.primaryBlueColor,
    ),
  );
}
