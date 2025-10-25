import 'package:medigo/core/constatnts/images.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: AppImages.onboardingImage1PNG,
    title: 'Your savior in case of emergency',
    description: 'You can send a request to the nearest hospital',
  ),
  OnboardingModel(
    image: AppImages.onboardingImage2PNG,
    title: 'Your accepted',
    description: 'Go to the hospital for treatment.',
  ),
  OnboardingModel(
    image: AppImages.onboardingImage3PNG,
    title: 'For the hospital',
    description:
        'You can accept or reject the patient depending on the possibility of treatment.',
  ),
];
