import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';

class Splash extends StatelessWidget {
  const Splash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.appLogoSVG,
            width: 200,
            colorFilter: ColorFilter.mode(
              AppColors.primaryGreenColor,
              BlendMode.srcIn,
            ),
          ),
          Gap(20),
          Text(
            'Doctor Hunt ',
            style: TextStyle(
              color: AppColors.primaryGreenColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
