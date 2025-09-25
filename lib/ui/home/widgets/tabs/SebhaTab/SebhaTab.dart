import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tazkeer = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا اله الا الله',
    'لا حول ولا قوة الا بالله',
  ];

  int index = 0;
  int counter = 0;

  double angle = 0;

  void onClick() {
    angle += (20 / 360);
    counter++;
    if (counter == 33) {
      index++;
      counter = 0;
    }
    if (index == tazkeer.length) {
      index = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AssetsManager.sebhaBack,
          fit: BoxFit.fill,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: .7),
                Colors.black,
              ],
              stops: const [1, 2],
            ),
          ),
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                onClick();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        AssetsManager.islamiLogo,
                        width: width * 0.75,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Image.asset(AssetsManager.sebhaHead),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        RotationTransition(
                          turns: AlwaysStoppedAnimation(angle),
                          child: SvgPicture.asset(AssetsManager.sebhaBody),
                        ),
                        Column(
                          children: [
                            Text(
                              tazkeer[index],
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.whiteColor,
                              ),
                            ),
                            Text(
                              "$counter",
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
