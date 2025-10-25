import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class smoothPage extends StatelessWidget {
  const smoothPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
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
    );
  }
}
