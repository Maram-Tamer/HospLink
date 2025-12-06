import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/Welcome/widget/cart_welcom.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final scale = (size.width / 430).clamp(0.85, 1.2);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(50 * scale),
            Text(
              'Let\'s Go!',
              style: AppFontStyles.getSize32(
                fontWeight: FontWeight.bold,
                fontColor: theme.colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 250 * scale,
              height: 250 * scale,
              child: Image.asset(AppImages.logolPNG),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10 * scale),
              child: Text(
                'Our app helps you quickly access the nearest hospital. Submit your request, and if approved, we\'ll take immediate action to address your medical needs.',
                style: AppFontStyles.getSize18(
                  fontColor: theme.colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Gap(20 * scale),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30 * scale),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(20 * scale),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250 * scale,
                          height: 40 * scale,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 * scale),
                            color: theme.colorScheme.onSurface.withOpacity(0.1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => setState(() => isSelected = false),
                                child: Container(
                                  width: 120 * scale,
                                  height: 30 * scale,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? theme.colorScheme.onSurface.withOpacity(0.1)
                                        : theme.colorScheme.primary,
                                    borderRadius: BorderRadius.circular(15 * scale),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'As Patient',
                                      style: AppFontStyles.getSize14(
                                        fontColor: isSelected
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => setState(() => isSelected = true),
                                child: Container(
                                  width: 120 * scale,
                                  height: 30 * scale,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.onSurface.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15 * scale),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'As Hospital',
                                      style: AppFontStyles.getSize14(
                                        fontColor: isSelected
                                            ? theme.colorScheme.onPrimary
                                            : theme.colorScheme.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(30 * scale),
                    isSelected
                        ? CartWelcom(
                            image: AppImages.hpspitalWelcom,
                            routeLogin: Routes.login_H,
                            routeRegister: Routes.register_H,
                          )
                        : CartWelcom(
                            image: AppImages.profileWelcom,
                            routeLogin: Routes.login_P,
                            routeRegister: Routes.register_P,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
