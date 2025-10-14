import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
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
    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Gap(50),
            Text(
              'Lets Go!',
              style: AppFontStyles.getSize32(
                fontWeight: FontWeight.bold,
                fontColor: AppColors.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset(AppImages.LogolPNG),
            ),
            Text(
              'Our app helps you quickly access the nearest hospital. Submit your request, and if approved, we\'ll take immediate action to address your medical needs.',
              style: AppFontStyles.getSize18(fontColor: AppColors.geyTextform),
              textAlign: TextAlign.center,
            ),
            Gap(20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(30),
                    topStart: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.grey2Color,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelected = false;
                                  });
                                },
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.grey2Color
                                        : AppColors.primaryGreenColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'As Patient',
                                      style: AppFontStyles.getSize14(
                                        fontColor: isSelected
                                            ? AppColors.primaryGreenColor
                                            : AppColors.whiteColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSelected = true;
                                  });
                                },
                                child: Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primaryGreenColor
                                        : AppColors.grey2Color,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'As Hospital',
                                      style: AppFontStyles.getSize14(
                                        fontColor: isSelected
                                            ? AppColors.whiteColor
                                            : AppColors.primaryGreenColor,
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
                    Gap(30),
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
