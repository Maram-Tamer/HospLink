import 'package:flutter/material.dart';
import 'package:medigo/core/utils/theme.dart';
import 'package:medigo/features/auth/presentation/pages/DetailsAccount/Patient/page/settings.dart';

void main() {
  runApp(const MainApp());
}

/*void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MainApp(), // Wrap your app
  ),
);*/
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerConfig: Routes.routes,
    //   theme: AppTheme.lightTheme,
    //   debugShowCheckedModeBanner: false,
    // );
    return MaterialApp(
      home: SettingsScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
