import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.appLogoSVG,
            width: 200,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryBlueColor,
              BlendMode.srcIn,
            ),
          ),
          const Gap(20),
          const Text(
            'Hosp Link',
            style: TextStyle(
              color: AppColors.primaryBlueColor,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
