import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';

// ignore: must_be_immutable
class ButtomOnboarding extends StatelessWidget {
  String buttomName;
  final int currentIndex;
  final VoidCallback onPressed;
  ButtomOnboarding(
      {
        super.key, 
        required this.buttomName, 
        required this.currentIndex, 
        required this.onPressed
        });

  @override
  Widget build(BuildContext context) {
    return TextButton(style: TextButton.styleFrom(foregroundColor: ColorManager.goldColor),
      onPressed: () {onPressed();}, child: Text(buttomName));
  }
}
