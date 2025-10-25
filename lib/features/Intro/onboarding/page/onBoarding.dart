import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Intro/onboarding/widget/pagw_view_design.dart';
import 'package:medigo/features/Intro/onboarding/widget/smooth_page.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return pagwViewDesign(index: index);
              },
              itemCount: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                smoothPage(pageController: pageController),
                Gap(10),
                MainButton(
                  height: 60,
                  buttonText: currentIndex == 2 ? 'Lets Go' : 'Next',
                  onPressed: () {
                    if (currentIndex == 2) {
                      pushAndRemoveUntil(
                        context: context,
                        route: Routes.welcom,
                      );
                    }
                    if (currentIndex < 2) {
                      setState(() {
                        currentIndex++;
                        pageController.animateToPage(
                          currentIndex,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      });
                    }
                  },
                  borderRadius: 14,
                ),
                Gap(20),
                MainButton(
                  height: 60,
                  borderWidth: 2,
                  textColor: AppColors.primaryGreenColor,
                  borderColor: AppColors.primaryGreenColor,
                  buttomColor: AppColors.blueLight,
                  buttonText: 'Skip',
                  onPressed: () {
                    pushAndRemoveUntil(context: context, route: Routes.welcom);
                  },
                  borderRadius: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
