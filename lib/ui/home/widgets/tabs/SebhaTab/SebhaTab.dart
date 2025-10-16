import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({
    super.key,
  });

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  final List<String> zekr = ["سبحان الله", "الحمد لله", "الله اكبر"];
  int count = 33;
  int zekrcount = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    int beads = 33;
    double radius = 120;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorManager.blackColor, ColorManager.blackColor],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              stops: [0.7, 1]),
          image: DecorationImage(
              image: AssetImage(AssetsManager.sebhabackground),
              fit: BoxFit.cover)),
      child: SafeArea(
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
            const SizedBox(
              height: 16,
            ),
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: ColorManager.whiteColor),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Stack(
                children: [
                  const Row(),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.005,
                    left: MediaQuery.of(context).size.width * 0.43,
                    child: Image.asset(
                      AssetsManager.sebhaheader,
                      width: width * 0.20,
                    ),
                  ),
                  Positioned.fill(
                    top: MediaQuery.of(context).size.height * -0.06,
                    child: GestureDetector(
                      onTap: _onTasbehClick,
                      child: Transform.rotate(
                        angle: angle,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            for (int i = 0; i < beads; i++)
                              Transform.translate(
                                offset: Offset(
                                  radius * cos(2 * pi * i / beads),
                                  radius * sin(2 * pi * i / beads),
                                ),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                      gradient: RadialGradient(
                                        colors: [
                                          Color(0xffFFCF7C),
                                          Color(0xffDBAC5B),
                                          Color(0xffB6893A),
                                          Color(0xff77623D),
                                        ],
                                        center: Alignment.center,
                                      ),
                                      color: ColorManager.goldColor,
                                      shape: BoxShape.circle),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          zekr[zekrcount],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                              color: ColorManager.whiteColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "$count",
                          style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.whiteColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTasbehClick() {
    angle += (2 * pi) / 33;
    count--;
    if (count == 1) {
      zekrcount += 1;
      count = 33;
    }
    if (zekrcount == 3) {
      zekrcount = 0;
    }
    setState(() {});
  }
}
