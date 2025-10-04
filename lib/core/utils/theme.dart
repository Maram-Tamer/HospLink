import 'package:flutter/material.dart';
import 'package:medigo/core/constatnts/fonts.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    //scaffold theme
    scaffoldBackgroundColor: Colors.transparent,

    appBarTheme: AppBarTheme(

      centerTitle: true,
      titleTextStyle: AppFontStyles.getSize24(fontColor: AppColors.blackColor),
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.primaryGreenColor,
      surfaceTintColor: Colors.transparent,
    ),

    //snackbar theme
    snackBarTheme: SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.primaryGreenColor,
    ),

    //font theme
    fontFamily: AppFonts.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkColor,
      onSurface: AppColors.darkColor,
    ),

    //datepicker theme
    datePickerTheme: DatePickerThemeData(
      headerForegroundColor: AppColors.primaryGreenColor,
      backgroundColor: AppColors.whiteColor,
      subHeaderForegroundColor: AppColors.blackColor,
    ),

    //timepicker theme
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: AppColors.greyColor,
      dayPeriodTextColor: AppColors.primaryGreenColor,
      hourMinuteTextColor: AppColors.whiteColor,
      hourMinuteColor: AppColors.blackColor,
      dialBackgroundColor: AppColors.primaryGreenColor,
      backgroundColor: AppColors.whiteColor,
    ),

    //buttomNavigation bar decoration
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      showSelectedLabels: false,
      selectedItemColor: AppColors.primaryGreenColor,
    ),

    //text buttom theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryGreenColor,
        padding: EdgeInsets.all(5),
        foregroundColor: AppColors.whiteColor,
      ),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      
      enabledBorder: OutlineInputBorder(
        
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.slateGrayColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
      
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryGreenColor, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
    ),
  );
}
