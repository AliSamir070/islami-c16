import 'package:flutter/material.dart';
import 'package:islami_c16/core/resources/AssetsManager.dart';
import 'package:islami_c16/core/resources/ColorManager.dart';
import 'package:islami_c16/core/resources/RoutesManager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "image": AssetsManager.trhib,
      "title": "Welcome To Islami App",
      "subtitle": "",
    },
    {
      "image": AssetsManager.mousque2,
      "title": "Welcome To Islami",
      "subtitle": "We Are Very Excited To Have You In Our Community",
    },
    {
      "image": AssetsManager.quranonboarding,
      "title": "Reading the Quran",
      "subtitle": "Read, and your Lord is the Most Generous",
    },
    {
      "image": AssetsManager.doaa,
      "title": "Bearish",
      "subtitle": "Praise the name of your Lord, the Most High",
    },
    {
      "image": AssetsManager.mic,
      "title": "Holy Quran Radio",
      "subtitle":
      "You can listen to the Holy Quran Radio through the application for free and easily",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(AssetsManager.islamiLogo),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  onPageChanged: (index) => setState(() => currentIndex = index),
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            pages[i]["image"]!,
                            height: 300,
                            color: ColorManager.onboardingcolor,
                          ),
                          const SizedBox(height: 40),
                          Text(
                            pages[i]["title"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.onboardingcolor,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            pages[i]["subtitle"]!,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: ColorManager.onboardingcolor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Visibility(
                      visible: currentIndex > 0,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: TextButton(
                        onPressed: () {
                          controller.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: ColorManager.onboardingcolor,
                          backgroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          "Back",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.onboardingcolor,
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: currentIndex == index ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? ColorManager.onboardingcolor
                                : ColorManager.greycolor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == pages.length - 1) {
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.homeRoute,
                          );
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: ColorManager.onboardingcolor,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        currentIndex == pages.length - 1
                            ? "Finish"
                            : "Next",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.onboardingcolor,
                        ),
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

