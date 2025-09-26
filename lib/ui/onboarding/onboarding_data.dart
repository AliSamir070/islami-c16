import 'package:flutter/material.dart';

class OnboardingData {
  final String image;
  final String title;
  final String subtitle;

  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final List<OnboardingData> onboardingPages = [
  OnboardingData(
    image: "assets/images/onboarding1.png",
    title: "Welcome To Islami App",
    subtitle: "",
  ),
  OnboardingData(
    image: "assets/images/onboarding2.png",
    title: "Welcome To Islami",
    subtitle: "We Are Very Excited To Have You In Our Community",
  ),
  OnboardingData(
    image: "assets/images/onboarding3.png",
    title: "Reading the Quran",
    subtitle: "Read, and your Lord is the Most Generous",
  ),
  OnboardingData(
    image: "assets/images/onboarding4.png",
    title: "Bearish",
    subtitle: "Praise the name of your Lord, the Most High",
  ),
  OnboardingData(
    image: "assets/images/onboarding5.png",
    title: "Holy Quran Radio",
    subtitle:
    "You can listen to the Holy Quran Radio through the application for free and easily",
  ),
];
