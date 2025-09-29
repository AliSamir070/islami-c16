import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Align(
      alignment: AlignmentGeometry.topCenter,
      child: Image.asset(
        AssetsManager.islamiLogo,
        fit: BoxFit.fitWidth,
        width: width * 0.7,
      ),
    );
  }
}
