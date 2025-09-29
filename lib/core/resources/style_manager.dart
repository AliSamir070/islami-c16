import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';

abstract final class StyleManager {
  static const TextStyle tabsLabelStyle = TextStyle(
    color: ColorManager.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle onboardingTitleStyle = TextStyle(
    color: ColorManager.goldColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle onboardingDesciriptionStyle = TextStyle(
    color: ColorManager.goldColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle sebhaDoaaStyle = TextStyle(
    color: ColorManager.whiteColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
}
