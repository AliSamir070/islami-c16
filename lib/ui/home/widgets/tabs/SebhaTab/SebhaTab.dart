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
      rotationTurns += 1 / 33; // تلف مع كل تسبيحة

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
            // الخلفية
            Positioned.fill(
              child: Image.asset(
                AssetsManager.sebha_photo,
                fit: BoxFit.cover,
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // اللوجو
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetsManager.islamiLogo,
                      width: width * 0.75,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // النص
                  const Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: ColorManager.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // السبحة + الرأس + النص والعداد
                  Expanded(
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // جسم السبحة (بيلف)
                          AnimatedRotation(
                            turns: rotationTurns,
                            duration: const Duration(milliseconds: 300),
                            child: Image.asset(
                              AssetsManager.sebhaBody,
                              width: width * 0.85,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // رأس السبحة (ثابتة)
                          Positioned(
                            top: 0,
                            child: Image.asset(
                              AssetsManager.sebha_hed,
                              width: width * 0.28,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // الذكر + العداد
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                azkarList[currentZikrIndex],
                                style: const TextStyle(
                                  color: ColorManager.goldColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "$currentCount/33",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
