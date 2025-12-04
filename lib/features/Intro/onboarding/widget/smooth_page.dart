import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPage extends StatelessWidget {
  const SmoothPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      onDotClicked: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      effect: ExpandingDotsEffect(
        dotColor: AppColors.greyColor,
        activeDotColor: AppColors.primaryBlueColor,
        dotHeight: 10,
        dotWidth: 10,
        spacing: 5,
      ),
    );
  }
}
