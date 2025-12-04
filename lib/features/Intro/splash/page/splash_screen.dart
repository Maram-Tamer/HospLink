import 'package:flutter/material.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/features/Intro/splash/widget/splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      final bool onBoarding = LocalHelper.getIsOnBoardingShown() ?? false;
      final String? userId = LocalHelper.getUserId();
      final String? userType = LocalHelper.getUserType();

      if (onBoarding) {
        if (userId != null) {
          if (userType == 'hospital') {
            pushWithReplacment(context: context, route: Routes.Main_hospital);
          } else if (userType == 'patient') {
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
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: brightness == Brightness.dark
          ? Colors.black // Dark mode background
          : Colors.white, // Light mode background
      body: const Splash(),
    );
  }
}
