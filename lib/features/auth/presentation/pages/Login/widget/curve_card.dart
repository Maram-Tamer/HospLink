import 'package:flutter/material.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/widget/curveContaner.dart';

class CurveCard extends StatelessWidget {
  const CurveCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DeepBottomCurve(),
      child: Container(
        width: double.infinity,
        height: 200,
        color: AppColors.primaryGreenColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logolPNG,
              width: 150,
              height: 120,
            ),
            Text(
              'Media Go!',
              style: AppFontStyles.getSize32(
                fontColor: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
