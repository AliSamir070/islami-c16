import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../../core/resources/AssetsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int zekrIndex = 0;
  double rotationAngle = 0;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  void _onSebhaTap() {
    setState(() {
      counter++;
      rotationAngle += pi / 12;
      if (counter > 33) {
        counter = 0;
        zekrIndex = (zekrIndex + 1) % azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.sebhaBack),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height * 0.07),
            Image.asset(
              AssetsManager.islamiLogo,
              width: width * 0.65,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: height * 0.03),
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.05),
            GestureDetector(
              onTap: _onSebhaTap,
              child: SizedBox(
                width: width * 0.88,
                height: width * 0.88,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Transform.rotate(
                      angle: rotationAngle,
                      child: Image.asset(
                        AssetsManager.sebhaBody,
                        width: width * 0.9,
                      ),
                    ),
                    Positioned(
                      top: -width * 0.1,
                      child: Image.asset(
                        AssetsManager.sebhaHead,
                        width: width * 0.28,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          azkar[zekrIndex],
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "$counter",
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
          ],
        ),
      ),
    );
  }
}
