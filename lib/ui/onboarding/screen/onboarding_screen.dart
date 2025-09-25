import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';
import 'package:islami_c16/model/onboarding_model.dart';
import 'package:islami_c16/ui/onboarding/widgets/onboarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentPage = 0;
  final int pageCount = OnboardingModel.onboardingList.length;

  void onNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void onPrevious() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.blackColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsManager.islami,
              scale: 3.5,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingCard(
                    onboardingModel: OnboardingModel.onboardingList[index],
                  );
                },
                itemCount: pageCount,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      currentPage == 0 ? null : onPrevious();
                      setState(() {});
                    },
                    child: Text(
                      currentPage >= pageCount - 4 ? "Back" : "",
                      style: const TextStyle(
                        color: ColorManager.goldColor,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: ColorManager.goldColor,
                    ),
                    onDotClicked: (index) {
                      currentPage = index;
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                      setState(() {});
                    },
                  ),

                  //? ternary operator for the final page
                  currentPage == pageCount - 1
                      ? TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesManager.homeRoute);
                          },
                          child: const Text(
                            "Finish",
                            style: TextStyle(
                              color: ColorManager.goldColor,
                            ),
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            currentPage >= pageCount - 1 ? null : onNext();
                            setState(() {});
                          },
                          child: const Text(
                            "Next",
                            style: TextStyle(
                              color: ColorManager.goldColor,
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
