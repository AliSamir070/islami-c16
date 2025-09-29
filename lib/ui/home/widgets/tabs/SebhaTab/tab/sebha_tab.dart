// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';import '../../../../../../core/resources/AssetsManager.dart';
import '../../../../../../core/resources/style_manager.dart';
import '../widgets/custom_header.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tabs = 33;
  double rotate = 0;
  int doaa = 0;
  List<String> tasbihList = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetsManager.sebhaBackground)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              CustomHeader(),
              SizedBox(height: height * 0.05),

              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: StyleManager.sebhaDoaaStyle,
              ),
              SizedBox(height: height * 0.01),
              Expanded(
                child: Stack(
                  alignment: AlignmentGeometry.topCenter,
                  children: [
                    InkWell(
                      onTap: () {
                        if (doaa < 3) {
                          if (tabs > 1) {
                            setState(() {
                              tabs = tabs - 1;
                              rotate += (2 * 3.141592653589793) / 32;
                            });
                          } else if (tabs == 1) {
                            setState(() {
                              doaa++;
                              tabs = 33;
                            });
                          }
                        } else {
                          if (tabs > 1) {
                            setState(() {
                              tabs = tabs - 1;
                              rotate += (2 * 3.141592653589793) / 33;
                            });
                          } else if (tabs == 1) {
                            setState(() {
                              doaa = 0;
                              tabs = 33;
                            });
                          }
                        }
                      },
                      child: Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Transform.rotate(
                            angle: rotate,

                            child: SvgPicture.asset(AssetsManager.sebhaBodyLogo),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tasbihList[doaa],
                                style: StyleManager.sebhaDoaaStyle,
                              ),
                              SizedBox(height: height * 0.05),

                              Text("$tabs", style: StyleManager.sebhaDoaaStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.1,
                        bottom: height * 0.442,
                      ),
                      child: Image.asset(
                        AssetsManager.sebhaHeaderLogo,
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
