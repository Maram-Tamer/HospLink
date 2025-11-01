import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.buttonText,
    this.width,
    this.height,
    required this.onPressed,
    this.buttomColor = AppColors.primaryGreenColor,
    this.textColor = AppColors.whiteColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.icon,
  });
  final Color buttomColor;
  final double? borderRadius;
  final Color textColor;
  final Color? borderColor;
  final String buttonText;
  final double? width;
  final double? height;
  final double? borderWidth;
  final String? icon;

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttomColor,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(
                icon!,
                height: 30,
                colorFilter: ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
            Gap(10),
            Text(
              buttonText,
              style: AppFontStyles.getSize16(
                fontColor: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
