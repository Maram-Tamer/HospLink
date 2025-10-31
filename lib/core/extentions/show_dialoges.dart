import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';

enum DialogType { error, success, warning }

showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: type == DialogType.error
          ? AppColors.red
          : type == DialogType.warning
          ? AppColors.yellow
          : AppColors.primaryGreenColor,
      content: Text(message),
    ),
  );
}