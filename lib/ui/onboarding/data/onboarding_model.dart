

import '../../../core/resources/AssetsManager.dart';

class OnboardingModel {
  final String imageUrl;
  final String title;
  final String? description;

  OnboardingModel({
    required this.imageUrl,
    required this.title,
    this.description,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      imageUrl: AssetsManager.onboardingWelcome,
      title: "Welcome To Islami App",
    ),
    OnboardingModel(
      imageUrl: AssetsManager.onboardingCommunity,
      title: "Welcome To Islami App",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      imageUrl: AssetsManager.onboardingQuran,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      imageUrl: AssetsManager.onboardingBearish,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      imageUrl: AssetsManager.onboardingradio,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
