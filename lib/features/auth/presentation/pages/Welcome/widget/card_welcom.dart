import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class CardWelcom extends StatelessWidget {
  CardWelcom({super.key, required this.title, required this.icon});
  String icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(49, 114, 126, 121),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80, width: 80, child: SvgPicture.asset(icon)),
            Gap(15),
            Text(
              title,
              style: AppFontStyles.getSize24(
                fontColor: AppColors.primaryGreenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
