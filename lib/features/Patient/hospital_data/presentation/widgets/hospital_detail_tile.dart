import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class HospitalDetailsTile extends StatelessWidget {
  const HospitalDetailsTile({
    super.key,
    required this.text,
    required this.icon,
    this.color = AppColors.primaryGreenColor,
  });
  final String text;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            color,
            BlendMode.srcIn,
          ),
          height: 25,
          width: 25,
        ),
        Gap(10),
        Text(
          text,
          maxLines: 2,
          style: AppFontStyles.getSize16(fontColor: AppColors.darkColor),
        ),
      ],
    );
  }
}
