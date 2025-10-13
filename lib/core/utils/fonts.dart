import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';

class AppFontStyles {
  static TextStyle getSize12({
    double fontSize = 14,
    Color? fontColor = AppColors.darkGreyColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);

  static TextStyle getSize14({
    double fontSize = 14,
    Color? fontColor = AppColors.darkGreyColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);

  static TextStyle getSize16({
    double fontSize = 16,
    Color? fontColor = AppColors.darkGreyColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);

  static TextStyle getSize18({
    double fontSize = 18,
    Color fontColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w400,
  }) => TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);

  static TextStyle getSize24({
    double fontSize = 24,
    Color fontColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w500,
  }) => TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: fontColor);

  static TextStyle getSize32({
    double fontSize = 32,
    Color fontColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w600,
  }) => TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: fontColor);
}
