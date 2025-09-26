import 'package:flutter/material.dart';
import '../../core/resources/AssetsManager.dart';
import 'onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const Spacer(flex: 2),
        Image.asset(
          AssetsManager.islamiLogo,
          width: width * 0.65,
          fit: BoxFit.fitWidth,
        ),
        const Spacer(flex: 1),
        Image.asset(data.image, height: 250),
        const Spacer(flex: 1),
        Text(
          data.title,
          style: const TextStyle(
            color: Color(0xFFE2BE7F),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          data.subtitle,
          style: const TextStyle(
            color: Color(0xFFE2BE7F),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
