import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int currentCount = 0;
  int currentZikrIndex = 0;
  double rotationTurns = 0;

  final List<String> azkarList = [
    "سُبحان الله",
    "الحمد لله",
    "أستغفر الله",
  ];

  void _incrementCounter() {
    setState(() {
      currentCount++;
      rotationTurns += 1 / 33;

      if (currentCount > 33) {
        currentCount = 1;
        currentZikrIndex = (currentZikrIndex + 1) % azkarList.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: _incrementCounter,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                AssetsManager.sebha_photo,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetsManager.islamiLogo,
                      width: width * 0.75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            child: Image.asset(
                              AssetsManager.sebha_hed,
                              width: width * 0.38,
                              fit: BoxFit.cover,
                            ),
                          ),
                          AnimatedRotation(
                            turns: rotationTurns,
                            duration: const Duration(milliseconds: 300),
                            child: Image.asset(
                              AssetsManager.sebhaBody,
                              width: width * 0.85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                azkarList[currentZikrIndex],
                                style: const TextStyle(
                                  color: ColorManager.whiteColor,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "$currentCount/33",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
