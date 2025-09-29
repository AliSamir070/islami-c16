// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/resources/style_manager.dart';
import '../data/onboarding_model.dart';

class OnboardingDetails extends StatelessWidget {
  OnboardingModel onboardingModel;
  OnboardingDetails({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return onboardingModel.description != null
        ? Column(
            children: [
              Text(
                onboardingModel.title,
                style: StyleManager.onboardingTitleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.06),
              Text(
                onboardingModel.description!,
                style: StyleManager.onboardingDesciriptionStyle,
                textAlign: TextAlign.center,
              ),
            ],
          )
        : Text(
            onboardingModel.title,
            style: StyleManager.onboardingTitleStyle,
            textAlign: TextAlign.center,
          );
  }
}
