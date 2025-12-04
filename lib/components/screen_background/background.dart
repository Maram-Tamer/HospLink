import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isLandscape = size.width > size.height;

    // Dynamically scale gradient intensity based on screen width
    double opacityFactor = (size.width / 400).clamp(0.6, 1.0);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: isLandscape ? Alignment.centerLeft : Alignment.topCenter,
          end: isLandscape ? Alignment.centerRight : Alignment.bottomCenter,
          colors: isDark
              ? [
                  Color.fromARGB(
                    (150 * opacityFactor).toInt(),
                    50,
                    50,
                    50,
                  ),
                  Color.fromARGB(
                    (255 * opacityFactor).toInt(),
                    20,
                    20,
                    20,
                  ),
                ]
              : [
                  Color.fromARGB(
                    (255 * opacityFactor).toInt(),
                    209,
                    255,
                    231,
                  ),
                  Color.fromARGB(
                    (255 * opacityFactor).toInt(),
                    193,
                    227,
                    254,
                  ),
                ],
        ),
      ),
      child: child,
    );
  }
}
