import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class HospitalDetailsTile extends StatelessWidget {
  HospitalDetailsTile(
      {super.key,
      required this.text,
      required this.icon,
      this.color = AppColors.primaryGreenColor,
      this.style,
      this.onTap});
  final String text;
  final String icon;
  final Color color;
  final TextStyle? style;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            height: 20,
            width: 20,
          ),
          Gap(10),
          Expanded(
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: style ??
                  AppFontStyles.getSize14(
                    fontColor: AppColors.darkColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
