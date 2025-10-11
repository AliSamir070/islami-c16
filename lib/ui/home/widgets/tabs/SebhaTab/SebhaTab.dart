import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/StringsManager.dart';



class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => SebhaTabState();
}

class SebhaTabState extends State<SebhaTab> {
  static const List<String> tsabih = [
    "سبحان الله",
    " الله اكبر",
    "لا اله الا الله",
    "الحمد لله",
  ];

  int numberDone = 0;
  int index = 0;
  double rotationAngle = 0;
  String currentWord = tsabih[0];

  void increasedCounter() {
    setState(() {
      numberDone++;
      rotationAngle += 15;
      if (numberDone == 31) {
        numberDone = 0;
        index++;
        if (index >= tsabih.length) {
          index = 0;
        }
        currentWord = tsabih[index];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.tasbihbackground),//background
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(AssetsManager.islami, fit: BoxFit.fitHeight, height: 130),
          const SizedBox(height: 21),
          const Text(
            StringsManager.tasbih,
            style: TextStyle(color: ColorManager.whiteColor, fontSize: 36.0,fontWeight:FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Image.asset(
            AssetsManager.sebhahead,
            height: 70,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(height: 0),
          GestureDetector(
            onTap: increasedCounter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: rotationAngle,
                  child: Image.asset(
                    AssetsManager.sebhabody,
                    height: 300,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      currentWord,
                      style: const TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            blurRadius: 4,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      numberDone.toString(),
                      style: const TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 3,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
