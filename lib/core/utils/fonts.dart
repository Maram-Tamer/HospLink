import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';

class AppFontStyles {
  static double _scale(double baseSize) {
    // Uses system text scaling without context
    final scaler = WidgetsBinding.instance.platformDispatcher.textScaleFactor;

    // Limit scaling for better UI control
    double scaled = baseSize * scaler;
    if (scaled < baseSize * 0.9) scaled = baseSize * 0.9; // Prevent too small
    if (scaled > baseSize * 1.4) scaled = baseSize * 1.4; // Prevent too large

    return scaled;
  }

  static TextStyle getSize12({
    double fontSize = 12,
    Color? fontColor = AppColors.darkGreyColor,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        fontSize: _scale(fontSize),
        fontWeight: fontWeight,
        color: fontColor,
      );

  static TextStyle getSize14({
    double fontSize = 14,
    Color? fontColor = AppColors.darkGreyColor,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        fontSize: _scale(fontSize),
        fontWeight: fontWeight,
        color: fontColor,
      );

  static TextStyle getSize16({
    double fontSize = 16,
    Color? fontColor = AppColors.darkGreyColor,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        fontSize: _scale(fontSize),
        fontWeight: fontWeight,
        color: fontColor,
      );

  static TextStyle getSize18({
    double fontSize = 18,
    Color fontColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      TextStyle(
        fontSize: _scale(fontSize),
        fontWeight: fontWeight,
        color: fontColor,
      );

  static TextStyle getSize24({
    double fontSize = 24,
    Color fontColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        fontSize: _scale(fontSize),
        fontWeight: fontWeight,
        color: fontColor,
      );

  static TextStyle getSize32({
    double fontSize = 32,
    Color fontColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      TextStyle(
        fontSize: _scale(fontSize),
        fontWeight: fontWeight,
        color: fontColor,
      );
}
