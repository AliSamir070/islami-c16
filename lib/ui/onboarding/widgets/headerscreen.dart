import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsManager.islamiLogo,
                  width: width * 0.75,
                  fit: BoxFit.cover,
                ),
              );
  }
}