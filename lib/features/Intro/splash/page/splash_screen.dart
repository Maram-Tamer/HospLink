import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Intro/splash/widget/splash.dart';
import 'package:medigo/features/auth/data/models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      bool onBoarding = LocalHelper.getIsOnBoardingShown() ?? false;
      if (onBoarding) {
        if (LocalHelper.getUserId() != null) {
          if (LocalHelper.getUserType() == 'hospital') {
            pushWithReplacment(context: context, route: Routes.Main_hospital);
          } else if (LocalHelper.getUserType() == 'patient') {
            pushWithReplacment(context: context, route: Routes.Main_patient);
          } else {
            pushWithReplacment(context: context, route: Routes.welcom);
          }
        } else {
          pushWithReplacment(context: context, route: Routes.welcom);
        }
      } else {
        pushWithReplacment(context: context, route: Routes.onBoarding_1);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: Splash(),
    );
  }
}
