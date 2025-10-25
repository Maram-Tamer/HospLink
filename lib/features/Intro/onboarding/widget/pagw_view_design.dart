import 'package:flutter/material.dart';
import 'package:medigo/features/Intro/onboarding/widget/onBoardingModel.dart';

class pagwViewDesign extends StatelessWidget {
  pagwViewDesign({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
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
  }
}
