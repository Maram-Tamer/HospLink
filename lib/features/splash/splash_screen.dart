import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      //pushWithReplacment(context: context, route: Routes.ChangePassword);
      pushWithReplacment(context: context, route: Routes.onBoarding_1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: Center(
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
      ),
    );
  }
}
