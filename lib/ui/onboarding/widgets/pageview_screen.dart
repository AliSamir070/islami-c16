import 'package:flutter/material.dart';
import 'package:islami_c16/ui/onboarding/widgets/class_modal_onboarding.dart';

class OnBoardingPageView extends StatefulWidget {
  final Function(int) onPageChanged;
  final PageController mycontroller;

  const OnBoardingPageView({super.key, required this.onPageChanged,required this.mycontroller});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      controller: widget.mycontroller,
      onPageChanged:widget.onPageChanged,
      itemCount: OnBoardingModal.onboard.length,
      itemBuilder: (context, index) {
        return Image.asset(
          OnBoardingModal.onboard[index].pngImage,
        );
      },
    );
  }
}
