import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medigo/components/ScrrenBackgroung/background.dart';
import 'package:medigo/core/constatnts/icons.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/auth/presentation/pages/Welcome/widget/card_welcom.dart';
import '../../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome to HospLink!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF19C37D),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Connecting you with emergency care when it matters most !',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Text(
                  'To get started, please select your account type.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                Gap(30),
                GestureDetector(
                  onTap: () {
                    pushTo(context: context, route: Routes.login_H);
                  },
                  child: CardWelcom(
                    title: 'Login as Hospital',
                    icon: AppIcons.hospitalHomeActiveSVG,
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    pushTo(context: context, route: Routes.login_P);
                  },
                  child: CardWelcom(
                    title: 'Login as Patient',
                    icon: AppIcons.personSettingSVG,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
