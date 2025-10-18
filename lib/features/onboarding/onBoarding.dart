import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medigo/components/buttons/main_button.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/onboarding/onBoardingModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                return Column(
                  children: [
                    Spacer(),
                    Image.asset(onboardingList[index].image, height: 300),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            child: Text(
                              onboardingList[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            onboardingList[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              children: [
                SmoothPageIndicator(
                  onDotClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColors.greyColor,
                    dotWidth: 10,
                    spacing: 5,
                    dotHeight: 10,
                    activeDotColor: AppColors.primaryGreenColor,
                  ),
                ),
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
