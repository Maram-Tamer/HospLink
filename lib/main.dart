import 'package:flutter/material.dart';
import 'package:medigo/core/utils/theme.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/DetailsSteps.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/otp_verfication_screen.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/reset_password_screen.dart';
import 'package:medigo/features/auth/presentation/pages/privacy%20policy/privacy_policy_screen.dart';
import 'package:medigo/features/auth/presentation/pages/signup/pages/hospital_signup_screen.dart';
import 'package:medigo/features/auth/presentation/pages/signup/pages/patient_signup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: PrivacyPolicyScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
