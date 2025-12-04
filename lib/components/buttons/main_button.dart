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
    this.buttomColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.icon,
  });

  final Color? buttomColor;
  final double? borderRadius;
  final Color? textColor;
  final Color? borderColor;
  final String buttonText;
  final double? width;
  final double? height;
  final double? borderWidth;
  final String? icon;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double w(double value) => value * size.width / 390; 
    double h(double value) => value * size.height / 844;

    // ✔ Default color is now primaryDarkColor instead of darkColor
    final effectiveButtonColor = buttomColor ?? AppColors.primaryBlueColor;

    // ✔ Keep default text color white
    final effectiveTextColor = textColor ?? AppColors.whiteColor;

    return SizedBox(
      width: width != null ? w(width!) : double.infinity,
      height: height != null ? h(height!) : h(55),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveButtonColor,
          padding: EdgeInsets.symmetric(horizontal: w(5), vertical: h(0)),
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
                height: h(26),
                colorFilter: ColorFilter.mode(
                  effectiveTextColor,
                  BlendMode.srcIn,
                ),
              ),
              Gap(w(10)),
            ],
            Text(
              buttonText,
              style: AppFontStyles.getSize16(
                fontColor: effectiveTextColor,
                fontWeight: FontWeight.w500,
              ).copyWith(fontSize: w(16)),
            ),
          ],
        ),
      ),
    );
  }
}
