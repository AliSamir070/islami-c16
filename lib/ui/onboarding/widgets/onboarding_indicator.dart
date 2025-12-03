import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/ui/onboarding/widgets/buttoms.dart';
import 'package:islami_c16/ui/onboarding/widgets/class_modal_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingIndicator extends StatefulWidget {
  int currentIndex;
  late PageController mycontroller;
  OnBoardingIndicator(
      {super.key, required this.currentIndex, required this.mycontroller});

  @override
  State<OnBoardingIndicator> createState() => _OnBoardingIndicatorState();
}

class _OnBoardingIndicatorState extends State<OnBoardingIndicator> {
  @override
  void initState() {
    super.initState();
    widget.mycontroller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    widget.mycontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtomOnboarding(
          buttomName: widget.currentIndex == 0 ? "" : "Back",
          currentIndex: widget.currentIndex,
          onPressed: () {
            if (widget.currentIndex > 0) {
              setState(() {
                widget.currentIndex -= 1;
              });
              widget.mycontroller.animateToPage(widget.currentIndex,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut);
            }
          },
        ),
        DotsIndicator(
          dotsCount: OnBoardingModal.onboard.length,
          position: widget.currentIndex.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: ColorManager.goldColor,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        ButtomOnboarding(
            buttomName:
                widget.currentIndex == OnBoardingModal.onboard.length - 1
                    ? "Finish"
                    : "Next",
            currentIndex: widget.currentIndex,
            onPressed: () async {
              if (widget.currentIndex == OnBoardingModal.onboard.length - 1) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool("seenonboarding", true);
                Navigator.pushReplacementNamed(
                    context, RoutesManager.homeRoute);
              } else {
                setState(() {
                  widget.currentIndex += 1;
                });
                widget.mycontroller.animateToPage(widget.currentIndex,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut);
              }
            }),
      ],
    );
  }
}
