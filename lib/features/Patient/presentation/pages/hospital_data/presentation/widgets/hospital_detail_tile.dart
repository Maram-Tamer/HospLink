import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

// ignore: must_be_immutable
class HospitalDetailsTile extends StatelessWidget {
  HospitalDetailsTile({
    super.key,
    required this.text,
    required this.icon,
    this.color,
    this.style,
    this.textColor,
    this.onTap,
  });

  final String text;
  final String icon;
  final Color? color;
  final TextStyle? style;
  final Color? textColor; // new parameter
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultTextColor = textColor ?? (isDark ? Colors.white : AppColors.darkColor);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(color ?? AppColors.primaryBlueColor, BlendMode.srcIn),
            height: 20,
            width: 20,
          ),
          const Gap(10),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: style ??
                  AppFontStyles.getSize16(
                    fontColor: defaultTextColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
