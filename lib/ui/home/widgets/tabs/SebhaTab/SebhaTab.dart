import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angle =0;
  int index =0;
  List<String>tsabih=[
  "سبحان الله",
    "الحمدلله",
    "لا اله الا الله",
    "الله اكبر",

  ];
  void _incrementCounter() {
    setState(() {
      counter++;
      angle += 360 / 33;

      if (counter > 33) {
        counter = 0;
        index = (index + 1) % tsabih.length;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.sebhaBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.islamiLogo,
            width: width * 0.75,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 16),
         const Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: ColorManager.whiteColor,
            ),
          ),
          const SizedBox(height: 40),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.translate(
                offset: const Offset(0, 8),
                child: Image.asset(
                  AssetsManager.sebhaBody3,
                  width: width * 0.3,
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedRotation(
                    turns: angle / 360,
                    duration: const Duration(milliseconds: 300),
                    child: Image.asset(
                      AssetsManager.sebhaBody1,
                      width: width * 0.9,
                    ),
                  ),

                  Column(
                    children: [
                      Text(
                        tsabih[index],
                        style:const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.whiteColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: _incrementCounter,
                        child: Text(
                          "$counter",
                          style:const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
