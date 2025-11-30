import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class itemPatientAccepted extends StatelessWidget {
  const itemPatientAccepted(
      {super.key, required this.icon, required this.title, this.maxLine});
  final String icon;
  final String title;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // مهم جداً علشان الودجت يبقى صغير

        children: [
          SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
          ),
          Gap(5),
          Flexible(
            child: Text(
              title,
              style: AppFontStyles.getSize12(fontColor: AppColors.darkColor),
              maxLines: maxLine ?? 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
