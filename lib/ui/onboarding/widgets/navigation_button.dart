// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../core/resources/style_manager.dart';

class NavigationButton extends StatefulWidget {
  String title;
  VoidCallback onPressed;
  NavigationButton({super.key, required this.title, required this.onPressed});

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.title,
        style: StyleManager.onboardingDesciriptionStyle.copyWith(fontSize: 14),
      ),
    );
  }
}
