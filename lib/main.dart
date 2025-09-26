import 'package:flutter/material.dart';
import 'package:medigo/core/utils/theme.dart';
import 'package:medigo/features/auth/presentation/pages/UserData/page/uyserData.dart';
import 'package:medigo/features/auth/presentation/pages/forget_password/pages/reset_password_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Enter_UserData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
