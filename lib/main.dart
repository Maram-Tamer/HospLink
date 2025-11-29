import 'package:flutter/material.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/services/local/local-helper.dart';
import 'package:medigo/core/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();

  // Helper to access the state from child widgets
  static _MainAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MainAppState>();
}

class _MainAppState extends State<MainApp> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    // Load saved dark theme preference
    isDarkMode = LocalHelper.getData(LocalHelper.kDarkTheme) ?? false;
  }

  // Method to toggle theme
  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
    LocalHelper.setData(LocalHelper.kDarkTheme, value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
