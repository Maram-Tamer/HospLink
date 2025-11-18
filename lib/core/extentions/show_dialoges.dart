import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medigo/core/constatnts/images.dart';
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
              ? Colors.orange
              : AppColors.primaryGreenColor,
      content: Text(message),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Lottie.asset(AppImages.LodingJson, width: 250)],
      ),
    ),
  );
}
