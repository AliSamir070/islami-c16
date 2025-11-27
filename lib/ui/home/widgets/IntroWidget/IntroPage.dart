import 'package:flutter/material.dart';

import '../../../../core/resources/AssetsManager.dart';
import '../../../../core/resources/ColorManager.dart';

class IntroPage extends StatelessWidget {
final String imagePath ;
final String title ;
final String subtitle ;
  const IntroPage({super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.islami,
            height: 171,
            width: 291,
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            imagePath,
            height: 415,
            width: 398,
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorManager.goldColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
            subtitle,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManager.goldColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
