import 'package:flutter/material.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
//Widget build(BuildContext context) {
// return MaterialApp(
  //   home: HospitalDetailsScreen(isAccepted: true),
  // );

//}

  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
