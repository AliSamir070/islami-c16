import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/ui/onboarding/widgets/assets_Textstyle.dart';
import 'package:islami_c16/ui/onboarding/widgets/class_modal_onboarding.dart';
import 'package:islami_c16/ui/onboarding/widgets/headerscreen.dart';
import 'package:islami_c16/ui/onboarding/widgets/onboarding_indicator.dart';
import 'package:islami_c16/ui/onboarding/widgets/pageview_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController mycontroller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    mycontroller = PageController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.blackColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ScreenHeader(),
              Expanded(
                  child: OnBoardingPageView(
                mycontroller: mycontroller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(OnBoardingModal.onboard[currentIndex].titleimage,
                    style: AssetsTextStyle.titleImage),
              ),
              OnBoardingModal.onboard[currentIndex].descriptionimage == null
                  ? const SizedBox.shrink()
                  :Text(
                    OnBoardingModal.onboard[currentIndex].descriptionimage!,
                    style: AssetsTextStyle.discriptionImage,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                height: 26,
              ),
              OnBoardingIndicator(currentIndex: currentIndex,mycontroller: mycontroller,)
            ],
          ),
        ));
  }
}