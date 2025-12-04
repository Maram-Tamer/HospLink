import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';

enum DialogType { error, success, warning }

//====================== SHOW SNACKBAR DIALOG ======================//

showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {
  final size = MediaQuery.of(context).size;
  double w(double value) => value * size.width / 390;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(w(20)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(w(12)),
      ),
      backgroundColor: 
          type == DialogType.error
              ? AppColors.red
              : type == DialogType.warning
                  ? Colors.orange
                  : AppColors.primaryBlueColor,
      content: Text(
        message,
        style: TextStyle(
          fontSize: w(16),
          color: Colors.white,
        ),
      ),
    ),
  );
}

//====================== FIXED LOADING DIALOG ======================//

showLoadingDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;
  double w(double value) => value * size.width / 390;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,

      insetPadding: const EdgeInsets.all(20), // prevents overflow even with keyboard

      child: Center(
        child: Lottie.asset(
          AppImages.LodingJson,
          width: w(180), // responsive & safe size
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
