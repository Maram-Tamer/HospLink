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
  final size = MediaQuery.of(context).size;
  double w(double value) => value * size.width / 390;
  double h(double value) => value * size.height / 844;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(w(20)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(w(12)),
      ),
      backgroundColor: type == DialogType.error
          ? AppColors.red
          : type == DialogType.warning
              ? Colors.orange
              : AppColors.primaryBlueColor,
      content: Text(
        message,
        style: TextStyle(fontSize: w(16)),
      ),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  double w(double value) => value * size.width / 390;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Lottie.asset(
        AppImages.LodingJson,
        width: w(250), // responsive loader width
      ),
    ),
  );
}
