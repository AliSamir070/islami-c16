import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/model/onboarding_model.dart';

class OnboardingCard extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingCard({
    super.key,
    required this.onboardingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            onboardingModel.imageUrl,
            height: MediaQuery.sizeOf(context).height * 0.4,
          ),
          Text(
            onboardingModel.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorManager.goldColor,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            onboardingModel.subTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManager.goldColor,
            ),
          ),
        ],
      ),
    );
  }
}
